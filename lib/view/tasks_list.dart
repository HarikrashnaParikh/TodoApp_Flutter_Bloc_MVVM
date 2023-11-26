import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';

import '../model/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(UpdateTask(task: task));
                },
              ),
              onLongPress: () =>
                  context.read<TaskBloc>().add(DeleteTask(task: task)),
            );
          }),
    );
  }
}
