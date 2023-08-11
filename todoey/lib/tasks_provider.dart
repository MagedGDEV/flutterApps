import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'models/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addNewTask(String taskTitle) {
    final newTask = Task(name: taskTitle);
    _tasks.add(newTask);
    notifyListeners();
  }

  void taskPressed(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
