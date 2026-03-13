import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
      backgroundColor: Colors.blue,
        title: Text(
          "Comments",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.white),
        ),
        centerTitle: true,
      ),

      ///Body
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(top: h*.025),
            child: Container(
              height: h*.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black38,
                    offset: Offset(2, 8),
                    spreadRadius: 2 
                  )
                ]
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
