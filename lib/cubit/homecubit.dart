import 'package:flutter_bloc/flutter_bloc.dart';
import 'homestate.dart';
import '../models/productmodel.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<ProductModel> productsList = [];
  String selectedCategory = "all";

  void fetchProducts() {
    emit(HomeInitial());

    productsList = [
      ProductModel(
        id: "1",
        title: "iPhone 17 pro max",
        price: 93999,
        image: "lib/assets/iphone 17 pro max .png",
        description: "phone",
        category: "Phones",
      ),

      ProductModel(
        id: "2",
        title: "iPhone 17",
        price: 67000,
        image: "lib/assets/iphone 17.png",
        description: "phone",
        category: "Phones",
      ),
      ProductModel(
        id: "3",
        title: "iPhone 15",
        price: 48999,
        image: "lib/assets/iphone 15.png",
        description: "phone",
        category: "Phones",
      ),

      ProductModel(
        id: "4",
        title: "MacBook Air 2026",
        price: 68700,
        image: "lib/assets/laptop 2026.png",
        description: "laptop",
        category: "Laptops",
      ),
      ProductModel(
        id: "5",
        title: "MacBook Neo",
        price: 48400,
        image: "lib/assets/mac neo.png",
        description: "laptop",
        category: "Laptops",
      ),
      ProductModel(
        id: "6",
        title: "MacBook Air 2025",
        price: 67999,
        image: "lib/assets/laptop 2025.png",
        description: "laptop",
        category: "Laptops",
      ),
      ProductModel(
        id: "7",
        title: "AppleWatch \nSeries 11 ",
        price: 21000,
        image: "lib/assets/black watch.png",
        description: "smartwatch",
        category: "SmartWatches",
      ),
      ProductModel(
        id: "8",
        title: "AppleWatch \nSeries 11 ",
        price: 20500,
        image: "lib/assets/grey watch.png",
        description: "smartwatch",
        category: "SmartWatches",
      ),

      ProductModel(
        id: "9",
        title: "Sony Wireless \nHeadphones",
        price: 4999,
        image: "lib/assets/black headphone.png",
        description: "headphone",
        category: "HeadPhones",
      ),

      ProductModel(
        id: "10",
        title: "Sony Wireless \nHeadphones",
        price: 4899,
        image: "lib/assets/white headphone.png",
        description: "headphone",
        category: "HeadPhones",
      ),
    ];

    emit(HomeChange(productsList));
  }

  void changeCategory(String category) {
    selectedCategory = category;
    emit(HomeChange(productsList));
  }

  List<ProductModel> get selectedProducts {
    if (selectedCategory == "all") {
      return productsList;
    }

    return productsList
        .where((product) => product.category == selectedCategory)
        .toList();
  }
}
