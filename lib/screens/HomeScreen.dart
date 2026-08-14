import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/homecubit.dart';
import '../cubit/homestate.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              SizedBox(
                width: 40,
                height: 35,

                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu, size: 26),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                height: 50,
                child: Transform.translate(
                  offset: const Offset(-20, -4),
                  child: Transform.scale(
                    scale: 1,
                    child: Image.asset(
                      'lib/assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 40,
                height: 35,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, size: 26),
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 40,
                height: 35,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, size: 26),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xffeef8e9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Upgrade Your\nTech Lifestyle",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                const Text(
                                  "Premium electronics\nat the best prices.",
                                  style: TextStyle(fontSize: 11),
                                ),

                                const SizedBox(height: 10),
                                const Text(
                                  "Shop Now  :)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Transform.scale(
                              scale: 1.1,
                              child: Image.asset(
                                'lib/assets/ChatGPT Image Aug 14, 2026, 01_06_47 PM.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xffeef8e9),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.local_shipping_outlined),
                            SizedBox(width: 8),
                            const Text(
                              "Free Shipping",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.payment_outlined),
                            SizedBox(width: 8),
                            Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                children: [
                                  const Text(
                                    "Secure payment",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "100% Protected",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),

                            Icon(Icons.assignment_return_outlined),
                            SizedBox(width: 8),

                            Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                children: [
                                  const Text(
                                    "Easy Returns",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "30-return",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 40),
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<HomeCubit>().changeCategory("all");
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset("lib/assets/all.png"),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "All",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<HomeCubit>().changeCategory("Phones");
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset("lib/assets/phone.png"),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Phones",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          context.read<HomeCubit>().changeCategory("Laptops");
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset("lib/assets/laptop.png"),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Laptops",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<HomeCubit>().changeCategory(
                            "HeadPhones",
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset("lib/assets/headphone.png"),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "HeadPhones",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<HomeCubit>().changeCategory(
                            "SmartWatches",
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset("lib/assets/smartwatch.png"),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "SmartWatches",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final products = context
                          .read<HomeCubit>()
                          .selectedProducts;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < products.length; i += 2)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 180,
                                      height: 212,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                          Image.asset(
                                            products[i].image,
                                            width: 100,
                                            height: 100,
                                          ),

                                          Text(
                                            products[i].title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),

                                          SizedBox(height: 20),

                                          Row(
                                            children: [
                                              SizedBox(width: 15),
                                              Text(
                                                "EGP ${products[i].price}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width: 35,
                                                height: 32,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          95,
                                                          162,
                                                          61,
                                                        ),
                                                    foregroundColor:
                                                        Colors.white,

                                                    padding: EdgeInsets.zero,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                  ),
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  if (i + 1 < products.length)
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 180,
                                        height: 212,

                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
                                            Image.asset(
                                              products[i + 1].image,
                                              width: 100,
                                              height: 100,
                                            ),

                                            Text(
                                              products[i + 1].title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 20),

                                            Row(
                                              children: [
                                                SizedBox(width: 15),
                                                Text(
                                                  "EGP ${products[i + 1].price}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Spacer(),
                                                SizedBox(
                                                  width: 35,
                                                  height: 32,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                            255,
                                                            95,
                                                            162,
                                                            61,
                                                          ),
                                                      foregroundColor:
                                                          Colors.white,

                                                      padding: EdgeInsets.zero,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                      ),
                                                    ),
                                                    child: Icon(Icons.add),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
