import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

import '../models/task.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  // final List<Task> tasks;

  // const TasksList({Key? key, required this.tasks}) : super(key: key);

  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: const [
    //     TasksTile(),
    //     TasksTile(),
    //     TasksTile(),
    //   ],
    // );

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
              title: task.title,
              isChecked: task.isDone,
              checkboxcallback: (value) {
                //taskData.tasks[index].toggleIsDone();
                taskData.updateTask(task);
              },
              longPresscallback: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
