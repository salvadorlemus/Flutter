import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:base/Models/task.dart';

// Extending ChangeNotifier allows us to use the notifyListeners() method
// which will notify all listeners of changes to the data and read the values inside
// the ChangeNotifier class from other classes
class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount {
    return _taskList.length;
  }

  //https://api.flutter.dev/flutter/dart-collection/UnmodifiableListView-class.html
  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addTask(String taskName) {
    _taskList.add(Task(name: taskName));
    notifyListeners();
  }

  void removeTask(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }
}
