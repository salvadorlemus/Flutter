import 'package:flutter/material.dart';
import 'Constants.dart';

class CustomIconContentWidget extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomIconContentWidget(
      {super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
