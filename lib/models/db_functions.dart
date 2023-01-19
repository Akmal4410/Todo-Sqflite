import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todey/models/task.dart';

late Database database;

class DBFunctions {
  static Future<void> initDatabase() async {
    database = await openDatabase(
      'Todoey.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE Todoey (id INTEGER PRIMARY KEY, name TEXT, isFinished INTEGER)');
      },
    );
  }

  static Future<List<Map<String, Object?>>> getAllTask() async {
    final todoeyList = await database.rawQuery('SELECT * FROM Todoey');
    return todoeyList;
  }

  static Future<void> addTaskToDb(Task task) async {
    final isFinished = task.isFinished ? 1 : 0;
    log(isFinished.toString());
    await database.rawInsert(
      'INSERT INTO Todoey(name, isFinished) VALUES(?, ?)',
      [task.name, isFinished],
    );
    log('Inserted ino DB');
  }

  static Future<void> deleteTaskFromDb({required Task task}) async {
    await database.rawDelete(
      'DELETE FROM Todoey WHERE name = ?',
      [task.name],
    );
    log('Deleted Sucessfully');
  }

  static Future<void> updateTaskFromDB(Task task) async {
    task.isTaskFinished();
    final newIsFinished = task.isFinished ? 1 : 0;
    await database.rawUpdate(
      'UPDATE Todoey SET name = ?, isFinished = ? WHERE NAME = ?',
      [task.name, newIsFinished, task.name],
    );
    log('task updated');
  }
}
