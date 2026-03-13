// ignore_for_file: deprecated_member_use

import 'package:depi_03/quiz_app/screen/quiz_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QuizMaster",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: h * .5,
          width: w * .9,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(14),
          ),

          child: Column(
            mainAxisAlignment: .spaceEvenly,
            children: [
              //
              Container(
                height: h * .1,
                width: w * .2,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Icon(Icons.lightbulb, color: Colors.white, size: 40),
                ),
              ),

              //
              Column(
                children: [
                  Text(
                    "Ready for a challenge?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Test your knowladge across 20+ Categories \n and calm the global bandel ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),

              //
              MaterialButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(),
                    ),
                  );
                },
                child: Text(
                  "Start Quiz Now ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
