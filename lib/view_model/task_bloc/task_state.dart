part of 'task_bloc.dart';

@immutable
class TaskState extends Equatable {
  final List<Task> allTasks;

  const TaskState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props {
    return [allTasks];
  }
}
