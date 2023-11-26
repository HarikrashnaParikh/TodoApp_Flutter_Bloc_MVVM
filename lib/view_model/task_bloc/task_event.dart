part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

// ===>>> Add Task
class AddTask extends TaskEvent {
  final Task task;
  AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

// ===>>> Update Task
class UpdateTask extends TaskEvent {
  final Task task;
  UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

// ===>>> Delete Task
class DeleteTask extends TaskEvent {
  final Task task;
  DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
