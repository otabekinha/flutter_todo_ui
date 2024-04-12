import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/save_task/save_task.dart';
import 'package:todoey/widgets/add_task.dart';
import 'package:todoey/widgets/todo_lists.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _controller = TextEditingController();

  void checkBoxChanged(int index) {
    context.read<SaveTask>().onCheckBoxChanged(index);
  }

  void addNewTask() {
    context.read<SaveTask>().addTask(
          Task(
            title: _controller.text,
            isCompleted: false,
          ),
        );
    _controller.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => AddTask(
              createNewTask: addNewTask,
              controller: _controller,
            ),
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.indigo,
                    size: 30.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 0,
                left: 30,
                right: 30,
                bottom: 30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Consumer<SaveTask>(
                builder: (context, task, child) {
                  return ListView.builder(
                    itemCount: task.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoLists(
                        taskName: task.tasks[index].title,
                        taskCompleted: task.tasks[index].isCompleted,
                        onChanged: (value) => checkBoxChanged(index),
                        deleteFunction: () => context
                            .read<SaveTask>()
                            .deleteTask(task.tasks[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
