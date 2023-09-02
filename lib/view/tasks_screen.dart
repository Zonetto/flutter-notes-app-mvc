import 'package:flutter/material.dart';
import 'package:reminders_app/components/notes_list_row.dart';
import 'package:reminders_app/controller/todo_controller.dart';
import 'package:reminders_app/model/todo_mode.dart';

class TasksScreen extends StatefulWidget {
  final TodoController todoController;

  const TasksScreen({super.key, required this.todoController});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = widget.todoController;
    final List<TodoModel> tasks = todoController.getTasks;
    return NotesListRow(
      todoModel: tasks,
      todoController: todoController,
      setState: () async {
        await todoController.fetchDate();
        setState(() {});
      },
    );
  }
}
