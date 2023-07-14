import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskName,
      required this.checkboxCallback,
      required this.longPressCallback});

  final bool isChecked;
  final String taskName;
  final VoidCallback checkboxCallback;
  final VoidCallback longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => longPressCallback(),
      title: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (value) => checkboxCallback(),
      ),
    );
  }
}
