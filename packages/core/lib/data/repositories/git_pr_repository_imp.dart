import 'package:core/data/datasources/git_pr_datasource.dart';
import 'package:core/domain/entities/git_pr.dart';
import 'package:core/domain/repositories/git_pr_repository.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/git_pr_params.dart';
import 'package:dartz/dartz.dart';

class GitPrRepositoryImp implements GitPrRepository {
  final GitPrDataSource dataSource;
  GitPrRepositoryImp({required this.dataSource});

  @override
  Future<Either<Failure, GitPr>> call(GitPrParams params) async {
    final result = await dataSource.call(params);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }
}
