import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';
import 'package:flutter/material.dart';

class DateTile extends StatelessWidget {
  DateTile({Key? key, required this.date}) : super(key: key);
  DateEntity date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              Text(date.weekDay.substring(0, 3)),
              Text(date.day.toString())
            ],
          ),
        ),
      ),
    );
  }
}
