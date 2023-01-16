import 'package:core/data/models/git_rep_model.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/git_rep_params.dart';
import 'package:core/core/params/no_params.dart';
import 'package:dartz/dartz.dart';

abstract class GitRepDataSource {
  /// Retrieve GitRep information.
  /// Retrieve [GitRepModel] and return [GitRepParams] when successful.
  /// Return [Failure] when unsuccessful.
  Future<Either<DataBaseFailure, List<GitRepModel>>> call(NoParams params);
}
