import 'package:core/domain/entities/git_pr.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/git_pr_params.dart';
import 'package:dartz/dartz.dart';

abstract class GitPrRepository {
  Future<Either<Failure, GitPr>> call(GitPrParams params);
}
