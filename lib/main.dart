import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/save_task/save_task.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => SaveTask(),
        child: TasksScreen(),
      ),
    );
  }
}
