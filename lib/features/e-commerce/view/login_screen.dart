// ignore_for_file: must_be_immutable

import 'package:depi_03/features/e-commerce/cubit/auth_cubit_cubit.dart';
import 'package:depi_03/features/e-commerce/view/auth_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubitCubit>();

    return Scaffold(
      body: BlocConsumer<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) {
          if (state is AuthCubitSuccess) {
            if (state.loginData.statusCode == 200) {
            Get.snackbar("Success", state.loginData.message!, backgroundColor: Colors.blue);
            Get.offAll(AuthHomeScreen());
            print(state.loginData.data!.token);
            }else{
            Get.snackbar("Error", state.loginData.message! , backgroundColor: Colors.red);
            }
          }

          if (state is AuthCubitFailed) {
            Get.snackbar("Error", state.message);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  cubit.login(
                    email: email.text,
                    password: password.text,
                  );
                },
                child: state is AuthCubitLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Login"),
              ),
            ],
          );
        },
      ),
    );
  }
}