import 'package:depi_03/quiz_app/cubit/cubit/quiz_cubit_cubit.dart';
import 'package:depi_03/quiz_app/screen/home_screen.dart';
import 'package:depi_03/quiz_app/screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();

    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),

      body: BlocBuilder<QuizCubit, QuizCubitState>(
        builder: (context, state) {
          if (state is QuizLoaded) {
            return cubit.myScore > 5
                ? Column(
                    children: [
                      Center(
                        child: Container(
                          height: h * .15,
                          width: w * .3,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.workspace_premium,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        "Congratulations!",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "You have mastered this quiz!",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: h * .09),

                      Container(
                        height: h * .2,
                        width: w * .9,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.black,
                              offset: Offset(1, 5),
                              spreadRadius: 1,
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * .06,
                            vertical: h * .025,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Your Score",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                ),
                              ),
                              BlocBuilder<QuizCubit, QuizCubitState>(
                                builder: (context, state) {
                                  if (state is QuizLoaded) {
                                    return Text(
                                      "${state.score} / 10",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }

                                  return SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: w * .1,
                          vertical: h * .028,
                        ),
                        child: MaterialButton(
                          height: h * .08,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(),
                              ),
                              (route) => false,
                            );
                            cubit.resetQuiz();
                          },
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(Icons.repeat, color: Colors.white),

                              Text(
                                "Play Again",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //

                      //
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: w * .1,
                        ),
                        child: MaterialButton(
                          height: h * .08,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false,
                            );

                            cubit.resetQuiz();
                          },
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(Icons.repeat, color: Colors.black),

                              Text(
                                "Back to Home",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Center(
                        child: Container(
                          height: h * .15,
                          width: w * .3,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        "Sorry Try again!",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "You haven't mastered this quiz!",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: h * .09),

                      Container(
                        height: h * .2,
                        width: w * .9,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.black,
                              offset: Offset(1, 5),
                              spreadRadius: 1,
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * .06,
                            vertical: h * .025,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Your Score",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                ),
                              ),
                              BlocBuilder<QuizCubit, QuizCubitState>(
                                builder: (context, state) {
                                  if (state is QuizLoaded) {
                                    return Text(
                                      "${state.score} / 10",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }

                                  return SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: w * .1,
                          vertical: h * .028,
                        ),
                        child: MaterialButton(
                          height: h * .08,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(),
                              ),
                              (route) => false,
                            );
                            cubit.resetQuiz();
                          },
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(Icons.repeat, color: Colors.white),

                              Text(
                                "Play Again",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //

                      //
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: w * .1,
                        ),
                        child: MaterialButton(
                          height: h * .08,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false,
                            );
                            cubit.resetQuiz();
                          },
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(Icons.repeat, color: Colors.black),

                              Text(
                                "Back to Home",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
          }

          return SizedBox();
        },
      ),
    );
  }
}
