import 'package:bitbarg_todolist/features/todo_list/data/models/date_model.dart';
import 'package:bitbarg_todolist/features/todo_list/data/models/todo_model.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';

class DayTodosModel extends DayTodosEntity {
  DayTodosModel({
    required DateModel date,
    required List<TodoModel> todos,
  }) : super(date: date, todos: todos);

  factory DayTodosModel.fromJson(Map<String, dynamic> json) {
    return DayTodosModel(
      date: DateModel.fromJson(json['date']),
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': (date as DateModel).toJson(),
      'todos': (todos as List<TodoModel>).map((e) => e.toJson()).toList(),
    };
  }
}
