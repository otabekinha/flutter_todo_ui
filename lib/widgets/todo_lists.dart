import 'package:flutter/material.dart';

class ToDoLists extends StatelessWidget {
  const ToDoLists({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function() deleteFunction;

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
        Row(
          children: [
            Checkbox(
              activeColor: Colors.indigo,
              value: taskCompleted,
              onChanged: onChanged,
            ),
            IconButton(
              onPressed: deleteFunction,
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        )
      ],
    );
  }
}
