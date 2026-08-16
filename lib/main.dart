import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotech_flutter_project/screens/HomeScreen.dart';
import 'cubit/homecubit.dart';
import 'cubit/wishlist_cubit.dart';
import 'cubit/order_history_cubit.dart';
import 'package:robotech_flutter_project/screens/wishlist_screen.dart';
import 'package:robotech_flutter_project/screens/order_history_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => WishlistCubit(),
        ),
        BlocProvider(
          create: (context) => OrderHistoryCubit(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}