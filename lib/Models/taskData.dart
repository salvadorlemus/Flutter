import 'package:flutter/foundation.dart';
import 'package:base/Models/task.dart';

// Extending ChangeNotifier allows us to use the notifyListeners() method
// which will notify all listeners of changes to the data and read the values inside
// the ChangeNotifier class from other classes
class TaskData extends ChangeNotifier {
  List<Task> taskList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
}
