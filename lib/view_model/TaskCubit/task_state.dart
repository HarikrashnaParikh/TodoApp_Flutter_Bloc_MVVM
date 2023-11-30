part of 'task_cubit.dart';

@immutable
class TaskState extends Equatable {
  List<Task> allTasks;

  TaskState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props {
    return [allTasks];
  }

  Map<String, dynamic> toMap() {
    return {
      "allTasks": allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
