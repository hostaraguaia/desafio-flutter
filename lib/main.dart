import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cache/cache_service_hive.dart';
import 'env/env_app.dart';
import 'github/pull/github_pull_repository_default.dart';
import 'github/pull/list/github_pull_list_cubit.dart';
import 'github/pull/list/github_pull_list_usecase_default.dart';
import 'github/repo/github_repo_page.dart';
import 'github/repo/github_repo_repository_default.dart';
import 'github/repo/list/github_repo_list_cubit.dart';
import 'github/repo/list/github_repo_list_usecase_default.dart';
import 'main/main_widget.dart';
import 'theme/theme_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.deleteFromDisk();

  runApp(
    MainWidget(
      title: EnvApp.title,
      theme: ThemeApp.data,
      child: GithubRepoPage(
        GithubRepoListCubit(
          GithubRepoListUsecaseDefault(
            GithubRepoRepositoryDefault(
              CacheServiceHive(),
            ),
          ),
        ),
        GithubPullListCubit(
          GithubPullListUsecaseDefault(
            GithubPullRepositoryDefault(
              CacheServiceHive(),
            ),
          ),
        ),
        title: EnvApp.title,
      ),
    ),
  );
}
