
import 'dart:async';


import 'package:brick_break/ball.dart';
import 'package:brick_break/coverscreen.dart';
import 'package:brick_break/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction { UP, DOWN }

class _HomePageState extends State<HomePage> {
//ball vars

  double ballX = 0;
  double ballY = 0;

  var ballDirection = direction.DOWN;

//player vars
  double playerX = -.2;
  double playerWidth = 0.4;


  //game settings
  bool hasGameStarted = false;

  //start game func
  void startGame(){
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      updateDirection();
      // update direction
      moveBall();
    });
  }

  void moveBall(){
    setState(() {
      if(ballDirection == direction.DOWN){
        ballY += 0.01;
      }else{
        ballY -= 0.01;
      }
    });
  }

  //update dierection
  void updateDirection(){
    setState(() {
  if(ballY >= 0.9){
    ballDirection = direction.UP;
  }
  else if(ballY <= -.9){
    ballDirection = direction.DOWN;
  }
});
  }

//move left
  void moveLeft(){
    setState(() {
      if(!(playerX - .2 < -1.0)){
        playerX -= 0.2;
      }
      
    });
  }
  //move right
  void moveRight(){
    setState(() {
      if(!(playerX + playerWidth > 1.0)){
        playerX += 0.2;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event){
        if(event is KeyDownEvent){
          if(event.logicalKey == LogicalKeyboardKey.arrowLeft){
            moveLeft();
          }
          if(event.logicalKey == LogicalKeyboardKey.arrowRight){
            moveRight();
          }
        }
      },
      
      child: GestureDetector(
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
                ),

                //where is player
                //  Container(
                //     alignment: Alignment(playerX, 0.9),
                //     child: Container(
                //       height: 20,
                //       width: 5,
                //       color: Color.fromARGB(255, 90, 2, 51),
                //     ),
                //   ),

                //   Container(
                //     alignment: Alignment(playerX + playerWidth, 0.9),
                //     child: Container(
                //       height: 20,
                //       width: 5,
                //       color: Color.fromARGB(255, 90, 2, 51),
                //     ),
                //   ),
              ],  
            ),
          ),
        ),
      ),
    );
  }
}