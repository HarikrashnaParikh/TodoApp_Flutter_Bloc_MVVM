import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_firebase/model/task.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState());
  void addTask(Task task) {
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(task),
    ));
  }

  void updateTask(Task task) {
    final state = this.state;
    final int index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TaskState(allTasks: allTasks));
  }

  void deleteTask(Task task) {
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..remove(task),
    ));
  }
}
