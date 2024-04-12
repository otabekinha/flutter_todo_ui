import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isCompleted;

  Task({
    required this.title,
    required this.isCompleted,
  });
}

class SaveTask extends ChangeNotifier {
  // task list
  final List<Task> _tasks = [
    Task(
      title: 'Banana',
      isCompleted: false,
    ),
  ];

  List<Task> get tasks => _tasks;

  // add task
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void onCheckBoxChanged(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}
