import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Center(child: Text('I Am rich')),
        ),
        body: Center(
          child: Image(
            //image: NetworkImage(
            //'https://gamer-pride.com/wp-content/uploads/2020/03/yamete-kudasai.png'),
            image: AssetImage('images/index.jpg'),
          ),
        ),
      ),
    ),
  );
}
