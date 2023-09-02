import 'package:notes_app/model/todo_mode.dart';
import 'package:notes_app/services/database/sql_helper_prosessing.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'db.dart';

class TodoHelper extends SqlHelperProcessing {
  @override
  Future<int> createData(Map<String, dynamic> data) async {
    try {
      final sql.Database db = await dbTodo;
      final int id = await db.insert(
        ToDoTbl.todoTbl,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return id;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<int> delete(int id) async {
    final sql.Database db = await dbTodo;
    try {
      db.delete(
        ToDoTbl.todoTbl,
        where: '${ToDoTbl.columnTodoId} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      // debugPrint("NO  ");
    }
    return id;
  }

  @override
  Future<List<TodoModel>> fetchDate() async {
    throw UnimplementedError();
  }

  Future<List<TodoModel>> fetchDataByStatus(String status) async {
    final db = await dbTodo;
    final List<Map<String, dynamic>> data = await db.query(
      ToDoTbl.todoTbl,
      orderBy: ToDoTbl.columnTodoId,
      where: '${ToDoTbl.columnTodoStatus} = ?',
      whereArgs: [status],
    );
    List<TodoModel> todoModels =
        data.map((e) => TodoModel.fromJson(e)).toList();
    return todoModels;
  }

  @override
  Future<void> updateData(int id, String status) async {
    final sql.Database db = await dbTodo;
    db.rawUpdate(
      'UPDATE ${ToDoTbl.todoTbl} SET ${ToDoTbl.columnTodoStatus} = ? WHERE ${ToDoTbl.columnTodoId} = ?',
      [status, id],
    );
  }
}
