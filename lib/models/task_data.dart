import 'package:flutter/material.dart';
import 'package:todey/models/db_functions.dart';
import 'package:todey/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _taskList = [];

  int get taskListCount {
    return _taskList.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_taskList);
  }

  Future<void> getAllTask() async {
    _taskList.clear();
    final todoeyList = await DBFunctions.getAllTask();
    todoeyList.forEach((map) {
      final task = Task.fromJson(map);
      _taskList.add(task);
      notifyListeners();
    });
  }

  void addTaskToTaskList(Task task) async {
    await DBFunctions.addTaskToDb(task);
    await getAllTask();
  }

  void updateTask(Task task) async {
    await DBFunctions.updateTaskFromDB(task);
    await getAllTask();
  }

  void deleteTask(Task task) async {
    await DBFunctions.deleteTaskFromDb(task: task);
    await getAllTask();
  }
}
