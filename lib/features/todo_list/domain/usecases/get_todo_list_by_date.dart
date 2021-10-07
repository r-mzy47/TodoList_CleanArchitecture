import 'package:bitbarg_todolist/core/usercases/usecase.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

abstract class GetTodoListByDate implements UseCase<DayTodosEntity, DateTime> {
  @override
  Future<Either<Failure, DayTodosEntity>> call(DateTime date);
}

@Injectable(as: GetTodoListByDate, env: ["prod"])
class GetTodoListByDateIml implements GetTodoListByDate {
  final TodoRepository repository;

  GetTodoListByDateIml(this.repository);

  @override
  Future<Either<Failure, DayTodosEntity>> call(DateTime date) async {
    return await repository.getDayTodo(date);
  }
}
