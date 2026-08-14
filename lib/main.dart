import 'package:flutter/material.dart';
import 'package:robotech_flutter_project/screens/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/homecubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeCubit()..fetchProducts(),
        child: Homescreen(),
      ),
    );
  }
}
