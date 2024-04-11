import 'package:flutter/material.dart';

class AddTaskBottomsheetBody extends StatelessWidget {
  const AddTaskBottomsheetBody({
    super.key,
    required this.onCreateNewTask,
    required this.controller,
  });

  final VoidCallback onCreateNewTask;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            textAlign: TextAlign.center,
            'Add Task',
            style: TextStyle(
              fontSize: 22,
              color: Colors.indigo,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 3.0,
                ), // Change the color here
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 3.0,
                ), // Change the color here
              ),
            ),
            autofocus: true,
          ),
          const SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(0), // Adjust the radius as needed
              ),
            ),
            onPressed: onCreateNewTask,
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
