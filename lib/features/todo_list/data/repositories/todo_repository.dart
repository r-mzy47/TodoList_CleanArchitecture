import 'package:bitbarg_todolist/features/todo_list/data/datasources/data_source.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';
import 'package:bitbarg_todolist/core/error/failures.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TodoRepository, env: ["prod"], )
class TodoRepositoryImpl implements TodoRepository {
  DataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, DayTodosEntity>> getDayTodo(DateTime date) async {
    try {
      final todos = await dataSource.getTodos(date);
      return Right(todos);
    } on Exception {
      return Left(Failure("exeption"));
    }
  }
}
