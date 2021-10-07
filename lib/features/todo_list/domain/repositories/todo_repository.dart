import 'package:bitbarg_todolist/core/error/failures.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


abstract class TodoRepository {
  Future<Either<Failure, DayTodosEntity>> getDayTodo(DateTime date);
}  

