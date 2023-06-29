// Class to abstract the bottom button in the app
import 'package:flutter/material.dart';

import '../Constants.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BottomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: hexButtonCalculateBMIBackgroundColour,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: buttonCalculateBMIHeight,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            label,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
