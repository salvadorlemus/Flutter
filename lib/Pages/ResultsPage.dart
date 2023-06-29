// Page to show the results of the BMI calculator
import 'package:base/Constants.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/BottomButton.dart';
import '../CustomWidgets/ReusableCard.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: hexCardBackgroundActiveColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: resultTextStyle2,
                  ),
                  Text(
                    '18.3',
                    style: bmiTextStyle,
                  ),
                  Text(
                    'Your BMI result is quite low, you should eat more!',
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
                label: 'CALCULATE AGAIN',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
