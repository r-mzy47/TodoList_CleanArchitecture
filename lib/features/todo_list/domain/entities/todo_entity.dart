import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TodoEntity extends Equatable {
  final String time;
  final String title;
  final String color;
  final bool done;

  TodoEntity({
   required this.time,
   required this.title,
   required this.color,
   required this.done,
  });

  @override
  List<Object?> get props => [time, title, color, done];
}
