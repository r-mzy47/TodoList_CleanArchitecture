import 'package:bitbarg_todolist/core/error/failures.dart';
import 'package:bitbarg_todolist/core/injection.dart';
import 'package:bitbarg_todolist/core/status.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/todo_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/presentation/cubit/todolist_cubit.dart';
import 'package:bitbarg_todolist/mocks/mocks.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
void main() {
  setUpAll(() {
    configureDependencies("test");
  });
  final todos = DayTodosEntity(
      date: DateEntity(year: 1998, month: "9", day: 12, weekDay: "2"),
      todos: [
        TodoEntity(color: "color", done: true, time: "time", title: "title")
      ]);

  blocTest<TodolistCubit, TodolistState>(
    'emits loading and succees states when reload calls.',
    build: () {
      TodolistCubit todolistCubit = getIt<TodolistCubit>();
      MockGetTodoListByDate getTodoListByDate =
          todolistCubit.getTodoListByDate as MockGetTodoListByDate;

      when(getTodoListByDate.call(any)).thenAnswer((_) async => Right(todos));
      return todolistCubit;
    },
    act: (cubit) {
      cubit.reload();
    },
    expect: () => <TodolistState>[
      TodolistInitial(LoadingStatus(), todos: null),
      TodolistInitial(InitialStatus(), todos: todos),
    ],
  );

  blocTest<TodolistCubit, TodolistState>(
    'emits loading and error states when reload calls.',
    build: () {
      TodolistCubit todolistCubit = getIt<TodolistCubit>();
      MockGetTodoListByDate getTodoListByDate =
          todolistCubit.getTodoListByDate as MockGetTodoListByDate;

      when(getTodoListByDate.call(any)).thenAnswer((_) async => Left(Failure("some Error")));
      return todolistCubit;
    },
    act: (cubit) {
      cubit.reload();
    },
    expect: () => <TodolistState>[
      TodolistInitial(LoadingStatus(), todos: null),
      TodolistInitial(ErrorStatus(errorMessage: "some Error"), todos: null),
    ],
  );
}
