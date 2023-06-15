import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MagicBall());
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;

  /// Randomize ball textures
  void RandomBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              RandomBall();
            },
            child: Image.asset('images/ball$ballNumber.png')),
        ),
      ),
    );
  }
}

