import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/productmodel.dart';

class WishlistCubit extends Cubit<List<ProductModel>> {
  WishlistCubit() : super([]);

  void toggleFavorite(ProductModel product) {
    List<ProductModel> items = List.from(state);

    if (items.any((item) => item.id == product.id)) {
      items.removeWhere((item) => item.id == product.id);
    } else {
      items.add(product);
    }

    emit(items);
  }

  bool isFavorite(String productId) {
    return state.any((item) => item.id == productId);
  }
}
