import 'package:depi_03/features/e-commerce/cubit/auth_cubit_cubit.dart';
import 'package:depi_03/features/e-commerce/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BlocProvider(
        create: (context) => AuthCubitCubit(),
        child: LoginScreen(),
      ),
    );
  }
}