part of 'todolist_cubit.dart';

abstract class TodolistState extends Equatable {
  Status get status;
  String? get error;
  TodolistState setStatus(Status status);
}

@immutable
class TodolistInitial extends TodolistState {
  final Status _status;
  final DayTodosEntity? todos;
  TodolistInitial(this._status, {required this.todos});

  @override
  String? get error => error;

  @override
  TodolistState setStatus(Status status) {
    return TodolistInitial(status, todos: todos);
  }

  TodolistState setTodos(DayTodosEntity todos) {
    return TodolistInitial(InitialStatus(), todos: todos);
  }

  @override
  Status get status => _status;

  @override
  List<Object?> get props => [_status, todos];
}
