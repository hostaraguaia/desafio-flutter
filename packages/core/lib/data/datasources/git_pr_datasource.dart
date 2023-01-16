import 'package:core/domain/entities/git_pr.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/git_pr_params.dart';
import 'package:dartz/dartz.dart';

abstract class GitPrDataSource {
  /// Retrieve GitPR information.
  /// Retrieve [GitPR] and return [GitPrParams] when successful.
  /// Return [Failure] when unsuccessful.
  Future<Either<Failure, GitPr>> call(GitPrParams params);
}
