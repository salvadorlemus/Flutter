import 'package:flutter/material.dart';

class CustomIconContentWidget extends StatelessWidget {
  static const _hexTextColour = 0XFF8D8E98;
  final String label;
  final IconData icon;

  final labelTextStyle = const TextStyle(
    fontSize: 18.0,
    color: Color(_hexTextColour),
  );

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
