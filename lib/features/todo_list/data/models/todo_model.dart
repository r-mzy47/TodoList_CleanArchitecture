import 'package:bitbarg_todolist/features/todo_list/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    required String color,
    required bool done,
    required String time,
    required String title,
  }) : super(color: color, done: done, time: time, title: title);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      color: json['color'],
      done: json['done'],
      time: json['time'],
      title: json['title'],
    );
  }

  factory TodoModel.fromEntity(TodoEntity data) {
    return TodoModel(
        time: data.time, title: data.title, color: data.color, done: data.done);
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'done': done,
      'time': time,
      'title': title,
    };
  }
}
