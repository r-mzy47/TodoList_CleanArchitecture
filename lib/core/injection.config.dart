// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/todo_list/data/datasources/data_source.dart' as _i8;
import '../features/todo_list/data/repositories/todo_repository.dart' as _i9;
import '../features/todo_list/domain/repositories/todo_repository.dart' as _i6;
import '../features/todo_list/domain/usecases/get_todo_list_by_date.dart'
    as _i5;
import '../features/todo_list/presentation/cubit/todolist_cubit.dart' as _i7;
import 'package:bitbarg_todolist/mocks/mocks.dart' as _i4; 

const String _prod = 'prod';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio, registerFor: {_prod});
  gh.factory<_i3.Dio>(() => _i4.MockDio(), registerFor: {_test});
  gh.factory<_i5.GetTodoListByDate>(() => _i4.MockGetTodoListByDate(),
      registerFor: {_test});
  gh.factory<_i6.TodoRepository>(() => _i4.MockTodoRepository(),
      registerFor: {_test});
  gh.factory<_i7.TodolistCubit>(
      () => _i7.TodolistCubit(getTodoListByDate: get<_i5.GetTodoListByDate>()));
  gh.factory<_i8.DataSource>(() => _i8.DataSourceImpl(dio: get<_i3.Dio>()),
      registerFor: {_prod});
  gh.factory<_i8.DataSourceImpl>(() => _i8.DataSourceImpl(dio: get<_i3.Dio>()),
      registerFor: {_test});
  gh.factory<_i6.TodoRepository>(
      () => _i9.TodoRepositoryImpl(get<_i8.DataSource>()),
      registerFor: {_prod});
  gh.factory<_i5.GetTodoListByDateIml>(
      () => _i5.GetTodoListByDateIml(get<_i6.TodoRepository>()),
      registerFor: {_test});
  gh.factory<_i5.GetTodoListByDate>(
      () => _i5.GetTodoListByDateIml(get<_i6.TodoRepository>()),
      registerFor: {_prod});
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
