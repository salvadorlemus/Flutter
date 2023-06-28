// Purpose: This file contains the code for the reusable card custom widget of the BMI calculator.
// https://dart.dev/null-safety

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;

  // Adding the ? makes the Widget optional and we don't require a cardChild for
  // the ReusableCard widget in the constructor
  final Widget? cardChild;

  const ReusableCard ({super.key, required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}