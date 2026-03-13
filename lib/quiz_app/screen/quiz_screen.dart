// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:depi_03/quiz_app/cubit/cubit/quiz_cubit_cubit.dart';
import 'package:depi_03/quiz_app/screen/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Quiz"), backgroundColor: Colors.white),
      body: BlocBuilder<QuizCubit, QuizCubitState>(
        builder: (context, state) {
          final cubit = context.read<QuizCubit>();
          if (state is QuizLoaded) {
            return Column(
              children: [
                //

                new LinearPercentIndicator(
                width:w*.9,
                lineHeight: h*.025,
                percent: state.currentIndex.toDouble()/10,
                trailing: Icon(Icons.mood),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
                //
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: w * .05,
                    vertical: h * .025,
                  ),
                  child: Text(
                    cubit.getCurrentQuestions.question,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                //
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.getAnswers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * .06,
                          vertical: h * .01,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            cubit.selectAnswer(index);
                          },
                          child: Container(
                            height: h * .08,
                            width: w * .9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: BoxBorder.all(
                                width: 2,
                                color: state.selectedIndex == index
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25,
                                  color: Colors.black,
                                  offset: Offset(1, 3),
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.inner,
                                ),
                              ],
                            ),

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * .05,
                              ),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: h * .025,
                                        width: w * .05,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: state.selectedIndex == index
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: w * .028),
                                      Text(cubit.getAnswers[index]),
                                    ],
                                  ),
                                  Icon(
                                    state.selectedIndex == index
                                        ? Icons.check_circle_outline
                                        : null,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
                    onPressed: state.selectedIndex == null
                        ? null
                        : () {
                            cubit.answerQuestion(state.selectedIndex!);
                            cubit.nextQuestion(state.selectedIndex!);
                            print("my score ${cubit.myScore}");

                            if (state.currentIndex == 9) {
                              Navigator.of(context).push(MaterialPageRoute(builder:(context) => QuizResult(), ));
                            }
                          },
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        Icon(Icons.arrow_forward_rounded, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
