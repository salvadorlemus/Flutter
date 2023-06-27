// Purpose: This file contains the code for the Theme Data of the BMI calculator.

import 'package:flutter/material.dart';

ThemeData DarkThemeData()
{
  return ThemeData(
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
  );
}