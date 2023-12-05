import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';

import '../model/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        key: UniqueKey(),
        itemCount: widget.tasksList.length,
        itemBuilder: (context, index) {
          var task = widget.tasksList[index];
          return ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.isDone,
              onChanged: (value) {
                print("checkBox tixked $value");
                setState(() {
                  task.isDone = value ?? false;
                  value = task.isDone;
                });
                context.read<TaskCubit>().updateTask(task);
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<TaskCubit>().deleteTask(task);
              },
            ),
          );
        },
      ),
    );
  }
}
