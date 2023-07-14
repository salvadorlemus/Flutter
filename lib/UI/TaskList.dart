import 'package:flutter/material.dart';
import 'package:base/UI/taskTile.dart';
import 'package:base/Models/taskData.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // A list builder is used to build a list of widgets from a list of data
    // but just the ones that are on screen and not all of them at once
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          // Using the Provider.of method to access the taskList in the TaskData class
          taskName: Provider.of<TaskData>(context).taskList[index].name,
          isChecked: Provider.of<TaskData>(context).taskList[index].isDone,
          checkboxCallback: () {
            // setState(() {
            //   Provider.of<TaskData>(context).taskList[index].toggleDone();
            // });
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).taskList.length,
    );
  }
}
