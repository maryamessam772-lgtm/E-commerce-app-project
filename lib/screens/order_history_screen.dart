import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/order_model.dart';
import '../cubit/order_history_cubit.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final Color backgroundColor = const Color(0xFFF7F3EA);
  final Color greenColor = const Color(0xFF8FA888);

  String selectedFilter = 'All';

  List<String> filters = ['All', 'Pending', 'Shipped', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,

        leading: const BackButton(color: Color(0xFF2E2A24)),

        title: const Text(
          'My Orders',
          style: TextStyle(
            color: Color.fromARGB(255, 76, 105, 79),
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: Column(
        children: [
          buildFilters(),

          Expanded(
            child: BlocBuilder<OrderHistoryCubit, List<OrderModel>>(
              builder: (context, orders) {
                return buildOrders(orders);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ================= FILTERS =================

  Widget buildFilters() {
    return SizedBox(
      height: 55,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),

        itemCount: filters.length,

        itemBuilder: (context, index) {
          String filter = filters[index];

          bool isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },

            child: Container(
              margin: const EdgeInsets.only(right: 8),

              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

              decoration: BoxDecoration(
                color: isSelected ? greenColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                filter,

                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF2E2A24),

                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= ORDERS =================

  Widget buildOrders(List<OrderModel> orders) {
    List<OrderModel> filteredOrders = [];

    for (var order in orders) {
      if (selectedFilter == 'All' || order.status == selectedFilter) {
        filteredOrders.add(order);
      }
    }

    if (filteredOrders.isEmpty) {
      return const Center(
        child: Text(
          'No orders found',
          style: TextStyle(color: Color(0xFF8A8477)),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: filteredOrders.length,

      itemBuilder: (context, index) {
        return orderCard(filteredOrders[index]);
      },
    );
  }

  // ================= ORDER CARD =================

  Widget orderCard(OrderModel order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Color(0xFF8FA888),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Order #${order.orderId}',

                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                '\$${order.total.toStringAsFixed(2)}',

                style: const TextStyle(
                  color: Color.fromARGB(255, 89, 114, 82),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            'Address: ${order.address}',

            style: const TextStyle(
              color: Color.fromARGB(255, 59, 82, 64),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'Payment: ${order.paymentMethod}',

            style: const TextStyle(color: Color(0xFF8A8477), fontSize: 12),
          ),

          const SizedBox(height: 10),

          statusButton(order.status),
        ],
      ),
    );
  }

  // ================= STATUS =================

  Widget statusButton(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: greenColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        status,

        style: TextStyle(
          color: greenColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
