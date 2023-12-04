import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_firebase/model/task.dart';
import 'package:todo_app_with_firebase/routes/routes_import.gr.dart';
import 'package:todo_app_with_firebase/view/tasks_list.dart';
import 'package:todo_app_with_firebase/view_model/bloc_exports.dart';

import 'add_task_screen.dart';

@RoutePage()
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        context.read<TaskCubit>().getAllTask();
        List<Task> tasksList = state.allTasks;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                  onPressed: () => AutoRouter.of(context).push(AddTaskScreenRoute()),
                  icon: const Icon(Icons.add)),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(  
                    'Tasks',
                  ),
                ),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => AutoRouter.of(context).push(AddTaskScreenRoute()),
            tooltip: "Add Task",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
