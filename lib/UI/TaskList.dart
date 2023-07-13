import 'package:base/UI/taskCheckBox.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
        TaskElement(),
      ],
    );
  }
}

class TaskElement extends StatefulWidget {
  @override
  _TaskElementState createState() => _TaskElementState();
}

class _TaskElementState extends State<TaskElement> {
  bool isChecked = false;
  String taskName = 'Task Name';

  // Callback used to update the checkbox state
  void checkboxCallback(bool checkboxState) {
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}
