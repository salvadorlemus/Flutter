// Purpose: This file contains the code for the input page of the BMI calculator.

import 'package:flutter/material.dart';
import 'ReusableCard.dart';

const _hexCardBackgroundColour = 0XFF1D1E33;
const _hexButtonCalculateBMIBackgroundColour = 0xFFEB1555;
const _buttonCalculateBMIHeight = 80.0;

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
              Expanded(child:
              ReusableCard(
                colour: Color(_hexCardBackgroundColour),
              ),
            ),
              Expanded(child:
              ReusableCard(
                colour: Color(_hexCardBackgroundColour),
              ),
            ),
            ],
          )),
          Expanded(child: Row(
            children: const <Widget>[
              Expanded(child:
              ReusableCard(
                colour: Color(_hexCardBackgroundColour),
              ),
              ),
            ],
          )),
          Expanded(child: Row(
            children: const <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: Color(_hexCardBackgroundColour),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Color(_hexCardBackgroundColour),
                ),
              ),
            ],
          )),
          Container(
            color: const Color(_hexButtonCalculateBMIBackgroundColour),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: _buttonCalculateBMIHeight,
          ),
        ]
      ),
    );
  }
}

