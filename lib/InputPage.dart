// Purpose: This file contains the code for the input page of the BMI calculator.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ReusableCard.dart';
import 'package:base/CustomIconContentWidget.dart';

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
      body: Column(children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: const Color(_hexCardBackgroundColour),
                cardChild: CustomIconContentWidget(
                    label: "MALE", icon: FontAwesomeIcons.mars),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: const Color(_hexCardBackgroundColour),
                cardChild: CustomIconContentWidget(
                    label: 'FEMALE', icon: FontAwesomeIcons.venus),
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: Color(_hexCardBackgroundColour),
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: <Widget>[
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
      ]),
    );
  }
}
