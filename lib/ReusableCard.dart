// Purpose: This file contains the code for the reusable card custom widget of the BMI calculator.

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;

  const ReusableCard ({required this.colour, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}