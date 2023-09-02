import 'package:flutter/material.dart';
import 'package:notes_app/components/notes_list_row.dart';
import 'package:notes_app/controller/todo_controller.dart';
import 'package:notes_app/model/todo_mode.dart';

class DoneScreen extends StatefulWidget {
  final TodoController todoController;

  const DoneScreen({super.key, required this.todoController});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = widget.todoController;
    final List<TodoModel> done = todoController.getDone;
    return NotesListRow(
      todoModel: done,
      todoController: todoController,
      setState: () async {
        await todoController.fetchDate();
        setState(() {});
      },
    );
  }
}
