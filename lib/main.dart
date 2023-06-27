import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Change app bar theme for the dark theme
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        // Define the primary color for all the app
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xFF0A0E21),
        ),
          // change scaffold background color to the same as the theme
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          // Change the color of the texts
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              color: Colors.white,
            ),
        )
      ),
      home: InputPage(),
    );
  }
}

