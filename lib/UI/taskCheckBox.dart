import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox({this.isChecked = false, required this.toggleCheckboxState});

  final bool isChecked;

  // Added a callback function to update the checkbox state
  final Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: (value) => toggleCheckboxState(value),
    );
  }
}
