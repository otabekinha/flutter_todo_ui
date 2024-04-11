import 'package:flutter/cupertino.dart';

class SaveTask extends ChangeNotifier {
  // tasks list
  final List<Task> _tasks = [
    Task(title: 'Banana', isCompleted: false),
    Task(title: 'Apple', isCompleted: false),
    Task(title: 'Eat Apple', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  int get tasksLength => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void checkTask() {
    //TODO(otabek): Implement check
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

class Task {
  final String title;
  final bool isCompleted;

  Task({required this.title, required this.isCompleted});
}

void main() {}
