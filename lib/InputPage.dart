// Purpose: This file contains the code for the input page of the BMI calculator.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ReusableCard.dart';
import 'package:base/CustomIconContentWidget.dart';

const _hexCardBackgroundActiveColour = 0XFF1D1E33;
const _hexCardBackgroundInactiveColour = 0XFF111328;
const _hexButtonCalculateBMIBackgroundColour = 0xFFEB1555;
const _buttonCalculateBMIHeight = 80.0;

enum Gender { MALE, FEMALE, UNKNOW }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.UNKNOW;
  Color activeCardColor = Color(_hexCardBackgroundActiveColour);
  Color inactiveCardColor = Color(_hexCardBackgroundInactiveColour);

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
                onPress: () {
                  setState(() {
                    gender = Gender.MALE;
                  });
                },
                colour:
                    gender == Gender.MALE ? activeCardColor : inactiveCardColor,
                cardChild: const CustomIconContentWidget(
                    label: "MALE", icon: FontAwesomeIcons.mars),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    gender = Gender.FEMALE;
                  });
                },
                colour: gender == Gender.FEMALE
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: const CustomIconContentWidget(
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
                onPress: () => {},
                colour: Color(_hexCardBackgroundActiveColour),
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () => {},
                colour: Color(_hexCardBackgroundActiveColour),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () => {},
                colour: Color(_hexCardBackgroundActiveColour),
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
