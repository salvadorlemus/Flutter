import 'package:base/Models/task.dart';
import 'package:flutter/material.dart';
import 'package:base/UI/taskTile.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.taskList});

  // Reference so we can use a task list in my constructor
  final List<Task> taskList;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    // A list builder is used to build a list of widgets from a list of data
    // but just the ones that are on screen and not all of them at once
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          // In order to access the taskList in the TaskTile widget we need to
          // use the widget. prefix so it knows we are referring to the Widget that
          // this class is extending
          taskName: widget.taskList[index].name,
          isChecked: widget.taskList[index].isDone,
          checkboxCallback: () {
            setState(() {
              widget.taskList[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.taskList.length,
    );
  }
}
