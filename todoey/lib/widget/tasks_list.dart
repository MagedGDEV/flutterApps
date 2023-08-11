import 'package:flutter/material.dart';
import 'package:todoey/widget/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/tasks_provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: data.tasks[index].name,
              isChecked: data.tasks[index].isDone,
              checkboxCallBack: (bool? checked) {
                data.taskPressed(index);
              },
              longPressCallBack: () {
                data.deleteTask(index);
              },
            );
          },
          itemCount: data.tasks.length,
        );
      },
    );
  }
}
