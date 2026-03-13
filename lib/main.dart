import 'package:depi_03/comments_app/screens/comments_screen.dart';
import 'package:depi_03/quiz_app/cubit/cubit/quiz_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: CommentsScreen()),
    );
  }
}
