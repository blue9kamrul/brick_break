import 'dart:async';


import 'package:brick_break/ball.dart';
import 'package:brick_break/coverscreen.dart';
import 'package:brick_break/player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
//ball vars

  double ballX = 0;
  double ballY = 0;

//player vars
  double playerX = 0;
  double playerWidth = 0.3;


  //game settings
  bool hasGameStarted = false;

  //start game func
  void startGame(){
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
      ballY -= 0.01;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 175, 196),
      body: Center(
        child:  Stack(
          children: [
            //tap to play
            CoverScreen(
              hasGameStarted: hasGameStarted),

            //ball
            MyBall(
              ballX: ballX,
              ballY: ballY,
              ),
              //player
              MyPlayer(
                playerX: playerX,
                playerWidth: playerWidth,
              )

            ],  
          ),
        ),
      ),
    );
  }
}