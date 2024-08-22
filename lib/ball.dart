import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  final  ballX;
  final  ballY;
  const MyBall({super.key, this.ballX, this.ballY});

  @override
  Widget build(BuildContext context) {
    return Container(
       alignment:Alignment(ballX, ballY),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(100),
        ),
      )
    );
  }
}