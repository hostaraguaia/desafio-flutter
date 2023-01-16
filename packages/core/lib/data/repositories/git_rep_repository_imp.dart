import 'package:dartz/dartz.dart';
import 'package:core/data/datasources/git_rep_datasource.dart';
import 'package:core/domain/entities/git_rep.dart';
import 'package:core/domain/repositories/git_rep_repository.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/no_params.dart';

class GitRepRepositoryImp implements GitRepRepository {
  final GitRepDataSource dataSource;
  GitRepRepositoryImp({required this.dataSource});

  @override
  Future<Either<Failure, List<GitRep>>> getGitRepfromData(
      NoParams params) async {
    final result = await dataSource.call(params);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }
}
