import 'package:flutter/material.dart';
import 'package:base/UI/taskTile.dart';
import 'package:base/Models/taskData.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrap the ListView in a Consumer widget so that we can use the
    // Provider.of(context) method to access the ChangeNotifier class
    // using an alias taskData. Using this means that we are listening to changes
    // in the taskData class, and if there are any changes, the Consumer widget
    // will rebuild the ListView widget
    return Consumer<TaskData>(
      builder: (context, taskData, Widget? child) {
        // A list builder is used to build a list of widgets from a list of data
        // but just the ones that are on screen and not all of them at once
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              // Using the Provider.of method to access the taskList in the TaskData class
              taskName: taskData.taskList[index].name,
              isChecked: taskData.taskList[index].isDone,
              checkboxCallback: () {
                // Using the Provider.of method to access the taskList in the TaskData class
                // to updat ethe task is done status
                taskData.updateTask(taskData.taskList[index]);
              },
              longPressCallback: () {
                // Using the Provider.of method to access the taskList in the TaskData class
                // to delete the task
                taskData.deleteTask(taskData.taskList[index]);
              },
            );
          },
          itemCount: taskData.taskList.length,
        );
      },
    );
  }
}
