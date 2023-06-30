import 'package:flutter/material.dart';
import 'Pages/InputPage.dart';
import 'ThemeData.dart';
import 'Pages/ResultsPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkThemeData(),
      home: InputPage(),
    );
  }
}
