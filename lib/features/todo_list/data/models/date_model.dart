import 'package:bitbarg_todolist/features/todo_list/domain/entities/date_entity.dart';

class DateModel extends DateEntity {
  DateModel({
    required int day,
    required String month,
    required String weekDay,
    required int year,
  }) : super(day: day, month: month, weekDay: weekDay, year: year);

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      day: int.parse(json['day']) ,
      month: json['month'],
      weekDay: json['week_day'],
      year: int.parse(json['year']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day.toString(),
      'month': month,
      'week_day': weekDay,
      'year': year.toString(),
    };
  }
}
