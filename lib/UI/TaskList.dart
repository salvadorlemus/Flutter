import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TaskElement(taskName: 'This is a task 1'),
        TaskElement(taskName: 'This is a task 2'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
        TaskElement(taskName: 'This is a task 3'),
      ],
    );
  }
}

class TaskElement extends StatelessWidget {
  TaskElement({
    super.key,
    required taskName,
  });

  String taskName = 'Task Name';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      trailing: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
