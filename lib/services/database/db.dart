import 'package:sqflite/sqflite.dart';

class ToDoTbl {
  static const String todoTbl = "todo_tbl";
  static const String columnTodoId = "todo_id";
  static const String columnTodoTitle = "title";
  static const String columnTodoDate = "date";
  static const String columnTodoTime = "time";
  static const String columnTodoStatus = "status";
}

abstract class DatabaseHelper {
  Database? _dbTodo;

  Future<Database> get dbTodo async {
    if (_dbTodo != null) return _dbTodo!;

    _dbTodo = await initDatabase();
    return _dbTodo!;
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          '''create table ${ToDoTbl.todoTbl} (
              ${ToDoTbl.columnTodoId} INTEGER PRIMARY KEY AUTOINCREMENT,
              ${ToDoTbl.columnTodoTitle} TEXT,
              ${ToDoTbl.columnTodoDate} TEXT,
              ${ToDoTbl.columnTodoTime} TEXT,
              ${ToDoTbl.columnTodoStatus} TEXT
              )''',
        ).then((value) {
          print('table created');
        }).catchError((error) {
          print('error e${error.toString()}');
        });
      },
    );
  }
}
