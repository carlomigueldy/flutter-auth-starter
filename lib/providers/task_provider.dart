import 'package:auth_starter/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  get tasks => _tasks;

  /// add new task
  addTask(Task task) {
    this._tasks.add(task);

    notifyListeners();
  }

  /// remove a task
  removeTask(int id) {}
}
