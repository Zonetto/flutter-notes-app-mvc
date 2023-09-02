import 'package:flutter/material.dart';
import 'package:reminders_app/components/notes_list_row.dart';
import 'package:reminders_app/controller/todo_controller.dart';
import 'package:reminders_app/model/todo_mode.dart';

class ArchiveScreen extends StatefulWidget {
  final TodoController todoController;

  const ArchiveScreen({super.key, required this.todoController});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = widget.todoController;
    final List<TodoModel> archived = todoController.getArchived;
    return NotesListRow(
      todoModel: archived,
      todoController: todoController,
      setState: () async {
        await todoController.fetchDate();
        setState(() {});
      },
    );
  }
}
