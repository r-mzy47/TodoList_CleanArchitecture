import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/todo_entity.dart';
import 'package:equatable/equatable.dart';

import 'date_entity.dart';

class DayTodosEntity extends Equatable {
  final DateEntity date;
  final List<TodoEntity> todos;

  DayTodosEntity({
  required  this.date,
  required  this.todos,
  });

  @override
  List<Object?> get props => [date, todos];
}
