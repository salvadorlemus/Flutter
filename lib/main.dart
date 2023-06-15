import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text('Roll a dice'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    // Create a row for the dices
    return Center(
      child: Row(
        children: [
          // Use the Expanded widget to fill the available space
          Expanded(
            // Create a image asset, instead of use the full constructor
            // child  : Image ( image : AssetImage('images/dice1.png') ),
            // we use the shortcut
            // child : Image.asset('images/dice1.png')
            child: TextButton(
              onPressed: (){
                // We need to call the setState method to change the state of the app
                // since we are using a stateful widget
                setState(() {
                  RandomizeNumbers();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),),
          ),
          Expanded(
            // Create a image asset
            child: TextButton(
                onPressed: (){
                  setState(() {
                    RandomizeNumbers();
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }

  void RandomizeNumbers(){
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

}