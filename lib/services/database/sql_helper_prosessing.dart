import 'db.dart';

abstract class SqlHelperProcessing<T> extends DatabaseHelper {
  Future<void> fetchDate();
  Future<int> createData(Map<String, dynamic> data);
  Future<void> updateData(int id, String status);
  Future<int> delete(int id);
}
