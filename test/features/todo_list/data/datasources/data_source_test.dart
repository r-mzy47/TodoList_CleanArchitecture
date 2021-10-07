import 'dart:convert';
import 'package:bitbarg_todolist/core/injection.dart';
import 'package:bitbarg_todolist/features/todo_list/data/datasources/data_source.dart';
import 'package:bitbarg_todolist/features/todo_list/data/models/day_todos_model.dart';
import 'package:bitbarg_todolist/mocks/mocks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../jsons/json_reader.dart';

void main() {
  setUpAll(() {
    configureDependencies("test");
  });

  final dayTodos =
      DayTodosModel.fromJson(json.decode(jsonReader("day_todo_list.json")));

  test("check datasource return model on success api call", () async {
    final dataSource = getIt<DataSourceImpl>();
    final mockedDio = dataSource.dio as MockDio;

    when(mockedDio.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed("options"),
            cancelToken: anyNamed("cancelToken"),
            onReceiveProgress: anyNamed("onReceiveProgress")))
        .thenAnswer((_) async => Response(
            data: json.decode(jsonReader("day_todo_list.json")),
            requestOptions: RequestOptions(data: null, path: ""),
            statusCode: 200));

    final result = await dataSource.getTodos(DateTime.now());

    expect(result, dayTodos);
  });

  test("check datasource throws exeption on api call exeption", () async {
    final dataSource = getIt<DataSourceImpl>();
    final mockedDio = dataSource.dio as MockDio;

    when(mockedDio.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed("options"),
            cancelToken: anyNamed("cancelToken"),
            onReceiveProgress: anyNamed("onReceiveProgress")))
        .thenThrow(Exception());

    expect(() => dataSource.getTodos(DateTime.now()), throwsA(isA<Exception>()));
  });

  test("check datasource throws exeption on invalid status code", () async {
    final dataSource = getIt<DataSourceImpl>();
    final mockedDio = dataSource.dio as MockDio;

    when(mockedDio.get(any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed("options"),
            cancelToken: anyNamed("cancelToken"),
            onReceiveProgress: anyNamed("onReceiveProgress")))
        .thenAnswer((_) async => Response(
            data: json.decode(jsonReader("day_todo_list.json")),
            requestOptions: RequestOptions(data: null, path: ""),
            statusCode: 400));

    expect(() => dataSource.getTodos(DateTime.now()), throwsA(isA<Exception>()));
  });
}
