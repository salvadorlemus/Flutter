import 'package:base/Models/task.dart';
import 'package:flutter/material.dart';
import 'package:base/UI/taskTile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> taskList = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    // A list builder is used to build a list of widgets from a list of data
    // but just the ones that are on screen and not all of them at once
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskName: taskList[index].name,
          isChecked: taskList[index].isDone,
          checkboxCallback: () {
            setState(() {
              taskList[index].toggleDone();
            });
          },
        );
      },
      itemCount: taskList.length,
    );
  }
}
