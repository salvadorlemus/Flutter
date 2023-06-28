// Purpose: This file contains the code for the input page of the BMI calculator.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ReusableCard.dart';
import 'CustomIconContentWidget.dart';
import 'Constants.dart';

enum Gender { MALE, FEMALE, UNKNOW }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.UNKNOW;
  Color activeCardColor = hexCardBackgroundActiveColour;
  Color inactiveCardColor = hexCardBackgroundInactiveColour;
  int height = 180;

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
                  colour: gender == Gender.MALE
                      ? activeCardColor
                      : inactiveCardColor,
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
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: hexCardBackgroundActiveColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: numberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        // Copy Slider Theme from context and override the slider properties
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                          thumbColor: sliderThumbColor,
                          overlayColor: sliderOverlayColor,
                          activeTrackColor: sliderActiveColor,
                          inactiveTrackColor: sliderInactiveColor,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: sliderActiveColor,
                          inactiveColor: sliderInactiveColor,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () => {},
                  colour: hexCardBackgroundActiveColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () => {},
                  colour: hexCardBackgroundActiveColour,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: hexButtonCalculateBMIBackgroundColour,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: buttonCalculateBMIHeight,
        ),
      ]),
    );
  }
}
