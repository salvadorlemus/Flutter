// Purpose: This file contains the code for the input page of the BMI calculator.

import 'package:flutter/material.dart';
import 'ReusableCard.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      // Container for the widget
      body: Column (
        children: <Widget>[
          Expanded(child: Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: Color(0XFF1D1E33),),
            ),
              Expanded(child: ReusableCard(colour: Color(0XFF1D1E33),),
            ),
            ],
          ),
          ),
          Expanded(child: Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: Color(0XFF1D1E33),),
              ),
            ],
          ),
          ),
          Expanded(child: Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: Color(0XFF1D1E33),),
              ),
              Expanded(child: ReusableCard(colour: Color(0XFF1D1E33),),
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}

