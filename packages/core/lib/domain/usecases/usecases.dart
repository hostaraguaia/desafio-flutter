import 'package:core/helpers/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, dynamic>> call(Params params);
}
