import 'package:notes_app/services/database/db.dart';

class TodoModel {
  int? todoId;
  final String title;
  final String date;
  final String time;
  final String status;
  TodoModel({
    this.todoId,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    String? todoId = ToDoTbl.columnTodoId;
    String todoTitle = ToDoTbl.columnTodoTitle;
    String todoDate = ToDoTbl.columnTodoDate;
    String todoTime = ToDoTbl.columnTodoTime;
    String todoStatus = ToDoTbl.columnTodoStatus;
    return TodoModel(
      todoId: json[todoId],
      title: json[todoTitle],
      date: json[todoDate],
      time: json[todoTime],
      status: json[todoStatus],
    );
  }
}
