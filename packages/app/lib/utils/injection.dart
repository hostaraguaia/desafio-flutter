import 'package:core/core/bloc/git_rep_bloc.dart';
import 'package:core/data/datasources/git_rep_datasource.dart';
import 'package:core/data/datasources/remote/git_rep_remote_datasource_imp.dart';
import 'package:core/data/repositories/git_rep_repository_imp.dart';
import 'package:core/domain/repositories/git_rep_repository.dart';
import 'package:core/domain/usecases/get_git_rep_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerLazySingleton<GitRepRepository>(
      () => GitRepRepositoryImp(dataSource: getIt<GitRepDataSource>()));

  getIt.registerLazySingleton<GitRepDataSource>(
      () => GitRepRemoteDataSourceImp());

  getIt.registerLazySingleton<GetGitRepUseCase>(
      () => GetGitRepUseCase(repository: getIt<GitRepRepository>()));

  getIt.registerLazySingleton<GitRepBloc>(
      () => GitRepBloc(useCase: getIt<GetGitRepUseCase>()));
}
