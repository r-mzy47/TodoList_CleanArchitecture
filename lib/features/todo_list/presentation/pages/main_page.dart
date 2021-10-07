import 'package:bitbarg_todolist/core/status.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:bitbarg_todolist/features/todo_list/presentation/cubit/todolist_cubit.dart';
import 'package:bitbarg_todolist/features/todo_list/presentation/widgets/date_tile.dart';
import 'package:bitbarg_todolist/features/todo_list/presentation/widgets/separator.dart';
import 'package:bitbarg_todolist/features/todo_list/presentation/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<TodolistCubit>().reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Schedule"),
        leading: IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          onPressed: context.read<TodolistCubit>().reload,
        ),
      ),
      body: BlocBuilder<TodolistCubit, TodolistState>(
        builder: (context, state) {
          state as TodolistInitial;
          if (state.status is LoadingStatus) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.todos == null) {
            return Center(
              child: ElevatedButton(
                child: Text("something went wrong. try again!"),
                onPressed: context.read<TodolistCubit>().reload,
              ),
            );
          }
          return Column(
            children: [
              Separator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    DateTile(
                      date: state.todos!.date,
                    ),
                  ],
                ),
              ),
              Separator(),
              Expanded(child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(state.todos!.date.weekDay),
                        Text(state.todos!.date.toString()),
                      ],
                    ),
                  ),
                 ...state.todos!.todos
                          .map((e) => TodoTile(todo: e))
                          .toList(),
                ],
              ),)
            ],
          );
        },
      ),
    );
  }
}
