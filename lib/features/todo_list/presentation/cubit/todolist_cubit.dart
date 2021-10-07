import 'package:bitbarg_todolist/core/status.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/day_todos_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/todo_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/usecases/get_todo_list_by_date.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'todolist_state.dart';

@injectable
class TodolistCubit extends Cubit<TodolistState> {
  TodolistCubit({required this.getTodoListByDate})
      : super(TodolistInitial(InitialStatus(),
            todos: null));


  void reload() async {
    emit(state.setStatus(LoadingStatus()));
    final res = await getTodoListByDate(DateTime.fromMillisecondsSinceEpoch(0));
    res.fold((l) {
      emit(TodolistInitial(ErrorStatus(errorMessage: l.message), todos: null));
    }, (todos) {
      emit(TodolistInitial(InitialStatus(), todos: todos));
    });
  } 

  GetTodoListByDate getTodoListByDate;
}
