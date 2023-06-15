import 'package:flutter/material.dart';

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
        body: DiceePage(),
      ),
    ),
  );
}

class DiceePage extends StatelessWidget {
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
                print('Left button got pressed');
              },
              child: Image.asset('images/dice1.png'),),
          ),
          Expanded(
            // Create a image asset
            child: TextButton(
                onPressed: (){
                  print('Right button got pressed');
                },
                child: Image.asset('images/dice2.png')),
          ),
        ],
      ),
    );
  }
}
