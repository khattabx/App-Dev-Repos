import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  final void Function(bool?) checkboxChange;
  final void Function() ListTileDelete;

  TaskTile({
    required this.isChecked,
    required this.taskTile,
    required this.checkboxChange,
    required this.ListTileDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTile,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxChange,
      ),
      onLongPress: ListTileDelete,
    );
  }
}
