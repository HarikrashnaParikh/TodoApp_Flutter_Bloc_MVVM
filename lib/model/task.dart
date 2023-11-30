import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
// @Sync()
class Task extends Equatable {
  @Id()
  int internalId = 0;
  @Index()
  final String id;

  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.id, required this.title, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }
  //copyWith method is a convenient way to create a new instance of an object with some of its properties modified while keeping the rest unchanged.
  //To update existing
  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'isDone': this.isDone,
      'isDeleted': this.isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String ?? '',
      title: map['title'] as String ?? '',
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        isDone,
        isDeleted,
      ];
}
