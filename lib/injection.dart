import 'package:get_it/get_it.dart';

import 'api/api_service_github.dart';
import 'cache/cache_service_hive.dart';
import 'github/pull/github_pull_repository_default.dart';
import 'github/pull/list/github_pull_list_cubit.dart';
import 'github/pull/list/github_pull_list_usecase_default.dart';
import 'github/repo/github_repo_repository_default.dart';
import 'github/repo/list/github_repo_list_cubit.dart';
import 'github/repo/list/github_repo_list_usecase_default.dart';

final getIt = GetIt.instance;

void setupInjection() {
  // Services
  getIt.registerSingleton(ApiServiceGithub());
  getIt.registerSingleton(CacheServiceHive());

  // Repositories
  getIt.registerSingleton(GithubRepoRepositoryDefault(getIt.get<ApiServiceGithub>(), getIt.get<CacheServiceHive>()));
  getIt.registerSingleton(GithubPullRepositoryDefault(getIt.get<ApiServiceGithub>(), getIt.get<CacheServiceHive>()));

  // Usecases
  getIt.registerSingleton(GithubRepoListUsecaseDefault(getIt.get<GithubRepoRepositoryDefault>()));
  getIt.registerSingleton(GithubPullListUsecaseDefault(getIt.get<GithubPullRepositoryDefault>()));

  // Cubits
  getIt.registerSingleton(GithubRepoListCubit(getIt.get<GithubRepoListUsecaseDefault>()));
  getIt.registerSingleton(GithubPullListCubit(getIt.get<GithubPullListUsecaseDefault>()));
}
