import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/order_model.dart';

class OrderHistoryCubit extends Cubit<List<OrderModel>> {
  OrderHistoryCubit() : super([]);

  void addOrder(OrderModel order) {
    List<OrderModel> orders = List.from(state);

    orders.add(order);

    emit(orders);
  }

  void fetchOrderHistory() {
    emit(state);
  }
}
