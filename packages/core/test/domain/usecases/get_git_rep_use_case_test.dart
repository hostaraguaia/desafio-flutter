import 'package:core/domain/repositories/git_rep_repository.dart';
import 'package:core/domain/usecases/get_git_rep_use_case.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mocks/git_rep_mocks.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GetGitRepUseCase useCase;
  late GitRepRepository repository;
  late NoParams params;

  setUp(() {
    repository = MockGitRepRepository();
    useCase = GetGitRepUseCase(repository: repository);
    params = NoParams();
  });

  group('GetGitRep Use Case Test', () {
    test('Should get GitRep Entity for a given date from the repository',
        () async {
      var expected = gitRepEntityMockList();
      when(() => repository.getGitRepfromData(params))
          .thenAnswer((_) async => Right((expected)));
      final result = await useCase(params);
      expect(result, Right(expected));
      verify(() => repository.getGitRepfromData(params));
    });

    test('Should return Failure', () async {
      var expected =
          const Failure(message: 'Error Message: ', stackTrace: 'Log Debug: ');
      when(() => repository.getGitRepfromData(params))
          .thenAnswer((_) async => Left(expected));
      final result = await useCase(params);
      expect(result, Left(expected));
    });
  });
}
