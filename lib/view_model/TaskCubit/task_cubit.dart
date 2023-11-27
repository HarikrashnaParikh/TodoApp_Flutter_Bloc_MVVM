import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_firebase/model/task.dart';

import '../../database/auth_service.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final AuthService _authService = AuthService();
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

  Future<User?> registerUser(String email, String password) async {
    final user = await _authService.registerUser(email, password);
    return user;
  }

  Future<User?> loginUser(String email, String password) async {
    final user = await _authService.loginUser(email, password);
    return user;
  }
}
