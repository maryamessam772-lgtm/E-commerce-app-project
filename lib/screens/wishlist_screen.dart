import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_history_screen.dart';
import '../models/productmodel.dart';
import '../cubit/wishlist_cubit.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final Color backgroundColor = const Color(0xFFF7F3EA);
  final Color greenColor = const Color(0xFF8FA888);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,

        leading: const BackButton(color: Color(0xFF2E2A24)),

        title: const Text(
          'Wishlist',
          style: TextStyle(
            color: Color.fromARGB(255, 76, 105, 79),
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderHistoryScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.inventory_2_outlined,
              color: Color.fromARGB(255, 102, 145, 107),
            ),
          ),
        ],
      ),

      body: BlocBuilder<WishlistCubit, List<ProductModel>>(
        builder: (context, products) {
          if (products.isEmpty) {
            return emptyWishlist();
          } else {
            return wishlistProducts(products);
          }
        },
      ),
    );
  }

  Widget wishlistProducts(List<ProductModel> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            '${products.length} items',
            style: const TextStyle(color: Color(0xFF8A8477)),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return productCard(products[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget productCard(ProductModel product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),

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

      child: Row(
        children: [
          // صورة المنتج الحقيقية
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 207, 187),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF8A8477),
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم المنتج
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                // سعر المنتج
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 89, 114, 82),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: CartCubit mohmed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // إزالة المنتج من الـ Wishlist
          IconButton(
            onPressed: () {
              context.read<WishlistCubit>().toggleFavorite(product);
            },
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget emptyWishlist() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_border, size: 70, color: greenColor),

          const SizedBox(height: 20),

          const Text(
            'Your wishlist is empty',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Looks like you haven\'t added anything yet.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF8A8477)),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              // هنربطه بالـ Home بعدين
            },
            style: ElevatedButton.styleFrom(backgroundColor: greenColor),
            child: const Text(
              'Start Shopping',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
