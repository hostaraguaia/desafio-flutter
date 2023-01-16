import 'package:core/domain/entities/git_pr.dart';
import 'package:core/domain/usecases/usecases.dart';
import 'package:core/domain/repositories/git_pr_repository.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/git_pr_params.dart';
import 'package:dartz/dartz.dart';

class GetGitPrUseCase extends UseCase<GitPr, GitPrParams> {
  final GitPrRepository repository;
  GetGitPrUseCase({required this.repository});

  @override
  Future<Either<Failure, GitPr>> call(GitPrParams params) {
    return repository.call(params);
  }
}
