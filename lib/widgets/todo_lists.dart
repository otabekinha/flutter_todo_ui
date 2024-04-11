import 'package:flutter/material.dart';

class ToDoLists extends StatelessWidget {
  const ToDoLists({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          taskName,
          style: TextStyle(
            fontSize: 18,
            decoration: taskCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        Checkbox(
          activeColor: Colors.indigo,
          value: taskCompleted,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
