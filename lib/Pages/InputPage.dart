// Purpose: This file contains the code for the input page of the BMI calculator.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../CustomWidgets/BottomButton.dart';
import '../CustomWidgets/ReusableCard.dart';
import '../CustomWidgets/CustomIconContentWidget.dart';
import '../Constants.dart';
import '../CustomWidgets/RoundIconButton.dart';

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
  int weight = 60;
  int age = 19;

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
                  onPressed: () {
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
                  onPressed: () {
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
                          const Text(
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
                  colour: hexCardBackgroundActiveColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('WEIGHT', style: labelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        // for the kg CrossAxisAlignment.baseline
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(weight.toString(), style: numberTextStyle),
                          const Text('kg', style: labelTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    colour: hexCardBackgroundActiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('AGE', style: labelTextStyle),
                        Text(age.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        BottomButton(
            label: 'CALCULATE',
            onPressed: () {
              Navigator.pushNamed(context, '/results');
            }),
      ]),
    );
  }
}
