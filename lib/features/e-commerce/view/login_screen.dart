// ignore_for_file: must_be_immutable

import 'package:depi_03/core/helper/hive_helper.dart';
import 'package:depi_03/features/e-commerce/cubit/auth_cubit_cubit.dart';
import 'package:depi_03/features/e-commerce/view/auth_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

    // return Scaffold(
    //   body: BlocConsumer<AuthCubitCubit, AuthCubitState>(
    //     listener: (context, state) {
    //       if (state is AuthCubitSuccess) {
    //         if (state.loginData.statusCode == 200) {
    //           HiveHelper.setToken(state.loginData.data!.token!);
    //           print("Token was added========================");
    //         Get.snackbar("Success", state.loginData.message!, backgroundColor: Colors.blue);
    //         Get.offAll(AuthHomeScreen());
    //         print(state.loginData.data!.token);
    //         }else{
    //         Get.snackbar("Error", state.loginData.message! , backgroundColor: Colors.red);
    //         }
    //       }

    //       if (state is AuthCubitFailed) {
    //         Get.snackbar("Error", state.message);
    //       }
    //     },
    //     builder: (context, state) {
    //       return Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //             child: TextFormField(
    //               controller: email,
    //               decoration: InputDecoration(
    //                 hintText: "Email",
    //                 border: OutlineInputBorder(),
    //               ),
    //             ),
    //           ),

    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //             child: TextFormField(
    //               controller: password,
    //               decoration: InputDecoration(
    //                 hintText: "Password",
    //                 border: OutlineInputBorder(),
    //               ),
    //             ),
    //           ),

    //           ElevatedButton(
    //             onPressed: () {
    //               cubit.login(
    //                 email: email.text,
    //                 password: password.text,
    //               );
    //             },
    //             child: state is AuthCubitLoading
    //                 ? CircularProgressIndicator(color: Colors.white)
    //                 : Text("Login"),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );

    return Scaffold(
      body: Column(
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
            onPressed: () async {
              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim(),
                    );

                print("Login Success: ${userCredential}");
              } on FirebaseAuthException catch (e) {
                print(" Error: ${e.code}");

                if (e.code == 'user-not-found') {
                  print("No user found");
                } else if (e.code == 'wrong-password') {
                  print("Wrong password");
                }
              } catch (e) {
                print(" Unexpected error: $e");
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
