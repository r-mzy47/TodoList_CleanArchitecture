import 'package:equatable/equatable.dart';

abstract class Status extends Equatable {}

class LoadingStatus extends Status {
  final String? title;
  LoadingStatus({this.title});

  @override
  List<Object?> get props => [title];
}

class ErrorStatus extends Status {
  final String errorMessage;
  ErrorStatus({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class InitialStatus extends Status {
  @override
  List<Object?> get props => [];
}
