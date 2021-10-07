import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<OutputType, InputTupe> {
  Future<Either<Failure, OutputType>> call(InputTupe params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
