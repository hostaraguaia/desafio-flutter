import 'package:core/data/datasources/git_rep_datasource.dart';
import 'package:core/data/repositories/git_rep_repository_imp.dart';
import 'package:core/helpers/failure.dart';
import 'package:core/core/params/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/git_rep_mocks.dart';

void main() {
  late GitRepRepositoryImp repository;
  late GitRepDataSource dataSource;
  late NoParams params;
  setUp(() {
    dataSource = MockGitRepDataSource();
    repository = GitRepRepositoryImp(dataSource: dataSource);
    params = NoParams();
  });

  group('GitRep Repository Implementation test', () {
    test('Should return GitRep Model when calls the datasource', () async {
      when(() => dataSource.call(params))
          .thenAnswer((_) async => gitRepMockMap());
      final result = await repository.getGitRepfromData(params);
      expect(result, const Right(gitRepModelMock));
      verify(() => dataSource.call(params));
    });

    test('Should return Server Failure', () async {
      when(() => dataSource.call(params)).thenThrow(ServerException());
      final result = await repository.getGitRepfromData(params);
      expect(
        result,
        const Left(
          DataBaseFailure(
            message: 'DataBase Error Message: ',
            stackTrace: 'DataBase Log Debug: ',
          ),
        ),
      );
    });
  });
}
