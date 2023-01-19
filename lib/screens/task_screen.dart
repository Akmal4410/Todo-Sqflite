import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/models/task_data.dart';
import 'package:todey/screens/add_task_screen.dart';
import 'package:todey/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskData>(context, listen: false).getAllTask();
    });
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskListCount} Tasks',
                  style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Provider.of<TaskData>(context).tasks.isEmpty
                  ? const Center(
                      child: Text('The List is Empty'),
                    )
                  : const TaskList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          final textController = TextEditingController();

          showDialog(
            context: context,
            builder: (ctx) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: AddTaskDialog(textController: textController),
              );
            },
          );
        },
      ),
    );
  }
}
