import 'package:base/Models/task.dart';
import 'package:base/Screens/addTaskScreen.dart';
import 'package:flutter/material.dart';
import 'package:base/UI/TaskList.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> taskList = [];

  void addTaskToList(String taskName) {
    // print('addTaskToList $taskName');
    setState(() {
      taskList.add(Task(name: taskName));
    });

    // Hide the bottom sheet
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.list,
                      size: 30.0, color: Colors.lightBlueAccent),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${taskList.length} Tasks',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Scrollbar(
                child: TaskList(taskList: taskList),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          // By default, the BottomSheet will take up half the screen.
          //
          // For certain screen sizes, this may mean the Add button is obscured.
          // Setting the isScrolledControlled property to true you can make the
          // modal take up the full screen.
          //
          //To have the AddTaskScreen sit just above the keyboard,
          // you can wrap it inside a SingleChildScrollView, which determines
          // the padding at the bottom using a MediaQuery.
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(addTaskCallback: addTaskToList),
            ),
          );
        },
      ),
    );
  }
}
