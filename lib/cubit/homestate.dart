import 'package:robotech_flutter_project/models/productmodel.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChange extends HomeState {
  final List<ProductModel> products;

  HomeChange(this.products);
}
