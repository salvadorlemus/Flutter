// Purpose: This file contains the code for the reusable card custom widget of the BMI calculator.
// https://dart.dev/null-safety

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;

  // Adding the ? makes the Widget optional and we don't require a cardChild for
  // the ReusableCard widget in the constructor
  final Widget? cardChild;

  // I need to use VoidCallback instead of Func since I can pass a null void Func
  // and prevent this error The argument type 'Function' can't be assigned to the parameter type 'void Function()?'
  // https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct
  final VoidCallback? onPressed;

  ReusableCard(
      {super.key, required this.colour, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
