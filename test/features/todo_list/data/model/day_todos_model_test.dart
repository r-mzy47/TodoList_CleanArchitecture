import 'dart:convert';
import 'package:bitbarg_todolist/features/todo_list/data/models/date_model.dart';
import 'package:bitbarg_todolist/features/todo_list/data/models/day_todos_model.dart';
import 'package:bitbarg_todolist/features/todo_list/data/models/todo_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../jsons/json_reader.dart';

void main() {
  final todoList = DayTodosModel(
      date: DateModel(day: 3, month: "Feb", weekDay: "sunday", year: 2021),
      todos: [
        TodoModel(
          color: "0xFFEF5350",
          done: true,
          time: "09:00 AM",
          title: "Design team meeting",
        )
      ]);
  test(
    'toJson',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(jsonReader("day_todo_list.json"));
      final result = DayTodosModel.fromJson(jsonMap);
      expect(result, todoList);
    },
  );

  test(
    'fromJson',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(jsonReader("day_todo_list.json"));
      final result = todoList.toJson();
      expect(result, jsonMap);
    },
  );
}
