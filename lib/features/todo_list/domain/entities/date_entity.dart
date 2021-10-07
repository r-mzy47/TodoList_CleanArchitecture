import 'package:equatable/equatable.dart';

class DateEntity extends Equatable {
  final int year;
  final String month;
  final int day;
  final String weekDay;

  DateEntity({
  required  this.year,
  required  this.month,
  required  this.day,
  required  this.weekDay,
  });

  @override
  List<Object?> get props => [year, month, day, weekDay];

  String toString() => "$day $month, $year";
}
