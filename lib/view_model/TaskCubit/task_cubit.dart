import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:todo_app_with_firebase/model/task.dart';
import 'package:todo_app_with_firebase/object_box/objectbox.g.dart';

import '../../database/auth_service.dart';
import '../../object_box/ObjectBox.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState());
  final AuthService _authService = AuthService();
  ObjectBox objectBox = ObjectBox();
  late Box<Task> _taskStore;

  void addTask(Task task) async {
    _taskStore = await objectBox.initStore();
    _taskStore.put(task);
    final state = this.state;
    emit(TaskState(
      allTasks: _taskStore.getAll(),
    ));
    objectBox.closeStore();
  }

  void updateTask(Task task) async {
    _taskStore = await objectBox.initStore();
    // _taskStore.put(task);
    final state = this.state;
    final int index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks);
    allTasks.removeAt(index);
    print("before toggle");
    print(task.isDone);
    task.toggleDone();
    // task.isDone == false
    //     ? allTasks.insert(index, task.copyWith(isDone: true))
    //     : allTasks.insert(index, task.copyWith(isDone: false));
    print("after toggle");
    print(task.isDone);
    // allTasks.add(task);

    emit(TaskState(allTasks: _taskStore.getAll()));
    objectBox.closeStore();
  }

  void deleteTask(Task task) async {
    final state = this.state;
    _taskStore = await objectBox.initStore();
    _taskStore.remove(task.internalId);
    emit(TaskState(
      allTasks: _taskStore.getAll(),
    ));
    objectBox.closeStore();
  }

  void getAllTask() async {
    _taskStore = await objectBox.initStore();
    emit(TaskState(allTasks: _taskStore.getAll()));
    objectBox.closeStore();
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
