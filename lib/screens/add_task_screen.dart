import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/models/task.dart';
import 'package:todey/models/task_data.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: textController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                final taskText = textController.text.trim();
                log('gigiuygiuygiuy');
                if (taskText.isNotEmpty) {
                  log('message');
                  final task = Task(name: taskText);
                  Provider.of<TaskData>(context, listen: false)
                      .addTaskToTaskList(task);
                  log('gjh');
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'ADD',
              ),
            )
          ],
        ),
      ),
    );
  }
}
