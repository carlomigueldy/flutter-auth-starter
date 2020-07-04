import 'package:auth_starter/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = <Task>[
    Task(
        id: 1,
        title: 'Cool task',
        description: 'This is a great task!',
        date: '2020-05-21',
        isCompleted: false),
    Task(
        id: 2,
        title: 'git push',
        description: 'push code changes to repository',
        date: '2020-04-14',
        isCompleted: true),
    Task(
        id: 3,
        title: 'git pull',
        description: 'retrieve all changes from repository to local machine',
        date: '2020-03-16',
        isCompleted: false),
    Task(
        id: 4,
        title: 'git commit',
        description: 'commit changes',
        date: '2020-04-22',
        isCompleted: false),
    Task(
        id: 5,
        title: 'git branch',
        description: 'check current branch being used',
        date: '2020-05-07',
        isCompleted: true),
  ];

  get tasks => _tasks;

  /// add new task
  addTask(Task task) {
    this._tasks.add(task);

    notifyListeners();
  }

  /// remove a task
  removeTask(int id) {
    this._tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
