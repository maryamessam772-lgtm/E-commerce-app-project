class OrderModel {
  final String orderId;
  final double subtotal;
  final double shippingFee;
  final double total;
  final String address;
  final String paymentMethod;
  final String status;

  OrderModel({
    required this.orderId,
    required this.subtotal,
    required this.shippingFee,
    required this.total,
    required this.address,
    required this.paymentMethod,
    required this.status,
  });
}
