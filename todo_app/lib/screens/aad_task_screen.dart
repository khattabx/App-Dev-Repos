import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function AddTaskCallback;
  AddTaskScreen(this.AddTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'New Task ?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[400],
                fontWeight: FontWeight.bold),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            // ignore: sort_child_properties_last, prefer_const_constructors
            child: Text(
              "Add",
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.teal[400]),
          ),
        ],
      ),
    );
  }
}
