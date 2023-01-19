import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              isCheked: taskItem.isFinished,
              taskTitle: taskItem.name,
              checkBoxCallback: (bool? newCheckBoxState) {
                taskData.updateTask(taskItem);
              },
              onLongPress: () {
                taskData.deleteTask(taskItem);
              },
            );
          },
          itemCount: taskData.taskListCount,
        );
      },
    );
  }
}
