import 'package:bitbarg_todolist/core/injection.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/todo_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/repositories/todo_repository.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/usecases/get_todo_list_by_date.dart';
import 'package:bitbarg_todolist/mocks/mocks.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  setUpAll(() {
    configureDependencies("test");
  });
  final date = DateTime.fromMicrosecondsSinceEpoch(0);
  final todos = DayTodosEntity(
      date: DateEntity(year: 1998, month: "9", day: 12, weekDay: "2"),
      todos:
          [TodoEntity(color: "color", done: true, time: "time", title: "title")]);

  test(
    'should get todos for the date from the repository',
    () async {
      GetTodoListByDateIml usecase = getIt<GetTodoListByDateIml>();
      MockTodoRepository repository = usecase.repository as MockTodoRepository;
      // arrange
      when(repository.getDayTodo(any)).thenAnswer((_) async => Right(todos));
      // act
      final result = await usecase(date);
      // assert
      expect(result, Right(todos));
      verify(repository.getDayTodo(date));
      verifyNoMoreInteractions(repository);
    },
  );
}
