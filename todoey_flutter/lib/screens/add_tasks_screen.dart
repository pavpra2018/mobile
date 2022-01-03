import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

class AddTasksScreen extends StatelessWidget {
  // AddTasksScreen({Key? key, required this.addTask}) : super(key: key);
  // Function addTask;
  const AddTasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
            ),
            TextButton(
              onPressed: () {
                //addTask(newTaskTitle);
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                primary: Colors.lightBlueAccent,
              ),
              child: const Text(
                'Add',
              ),
            )
          ],
        ),
      ),
    );
  }
}
