import 'package:core/domain/entities/git_rep.dart';
import 'package:core/domain/usecases/usecases.dart';
import 'package:core/domain/repositories/git_rep_repository.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/no_params.dart';
import 'package:dartz/dartz.dart';

class GetGitRepUseCase implements UseCase<List<GitRep>, NoParams> {
  final GitRepRepository repository;
  GetGitRepUseCase({required this.repository});

  @override
  Future<Either<Failure, List<GitRep>>> call(NoParams params) async {
    return await repository.getGitRepfromData(params);
  }
}
