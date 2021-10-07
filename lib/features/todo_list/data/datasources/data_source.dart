import 'package:bitbarg_todolist/features/todo_list/data/models/date_model.dart';
import 'package:bitbarg_todolist/features/todo_list/data/models/day_todos_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Injectable(env: ["prod"])
  Dio get dio => Dio();
}

abstract class DataSource {
  Future<DayTodosModel> getTodos(DateTime date);
}

@Injectable(as: DataSource, env: ["prod"])
class DataSourceImpl implements DataSource {
  final Dio dio;

  DataSourceImpl({required this.dio});

  @override
  Future<DayTodosModel> getTodos(DateTime date) async {
    final response = await dio.get(
        'https://run.mocky.io/v3/cdd00c8f-d64a-4411-914d-f1c9236c6710',
        options: Options(receiveTimeout: 1000, sendTimeout: 1000));
    if (response.statusCode == 200) {
      return DayTodosModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
