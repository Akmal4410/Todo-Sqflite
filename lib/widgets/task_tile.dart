import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isCheked;
  final String taskTitle;
  final void Function(bool? value) checkBoxCallback;
  final void Function() onLongPress;

  const TaskTile({
    super.key,
    required this.isCheked,
    required this.taskTitle,
    required this.checkBoxCallback,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isCheked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isCheked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
