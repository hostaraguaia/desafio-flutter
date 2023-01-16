import 'package:core/domain/entities/git_rep.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/no_params.dart';
import 'package:dartz/dartz.dart';

abstract class GitRepRepository {
  Future<Either<Failure, List<GitRep>>> getGitRepfromData(NoParams params);
}
