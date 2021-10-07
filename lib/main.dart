import 'package:bitbarg_todolist/core/injection.dart';
import 'package:bitbarg_todolist/features/todo_list/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/todo_list/presentation/cubit/todolist_cubit.dart';

void main() {
  configureDependencies("prod");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BitBarg Todo List",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFFFFFFFF),
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          centerTitle: false,
        ),
      ),
      home: BlocProvider(
        create: (context) => getIt<TodolistCubit>(),
        child: MainPage(),
      ),
    );
  }
}
