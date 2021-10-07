import 'package:bitbarg_todolist/core/hex_color.dart';
import 'package:bitbarg_todolist/features/todo_list/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  TodoTile({Key? key, required this.todo}) : super(key: key);
  final TodoEntity todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Card(
        color: HexColor(todo.color),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.time,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    todo.title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  shape: BoxShape.circle,
                ),
                child: todo.done
                    ? Center(
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 12,
                        ),
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
