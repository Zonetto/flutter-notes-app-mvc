import 'package:flutter/material.dart';
import 'package:notes_app/model/todo_mode.dart';
import 'package:notes_app/services/database/todo_helper.dart';

class TodoController extends ChangeNotifier {
  final TodoHelper helper = TodoHelper();

  List<TodoModel> _tasks = [];
  List<TodoModel> _done = [];
  List<TodoModel> _archived = [];

  List<TodoModel> get getTasks => _tasks;

  List<TodoModel> get getDone => _done;

  List<TodoModel> get getArchived => _archived;

  Future<void> fetchDate() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      _tasks = [];
      _done = [];
      _archived = [];
      _tasks = await helper.fetchDataByStatus('new');
      _done = await helper.fetchDataByStatus('done');
      _archived = await helper.fetchDataByStatus('archive');
      notifyListeners();
    } catch (e) {
      //  print(e.toString());
    }
  }

  Future<void> createData(Map<String, dynamic> data) async {
    try {
      await helper.createData(data);
    } finally {
      fetchDate();
    }
  }

  Future<void> updateData({
    required int id,
    required String status,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      await helper.updateData(id, status);
    } finally {
      fetchDate();
    }
  }

  Future<void> delete({required int id}) async {
    try {
      await helper.delete(id);
    } finally {
      await fetchDate();
    }
  }
}
