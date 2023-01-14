import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'env/env_app.dart';
import 'github/pull/list/github_pull_list_cubit.dart';
import 'github/repo/github_repo_page.dart';
import 'github/repo/list/github_repo_list_cubit.dart';
import 'injection.dart';
import 'main/main_widget.dart';
import 'theme/theme_app.dart';

void main() async {
  setupInjection();

  await Hive.initFlutter();
  // await Hive.deleteFromDisk();

  runApp(
    MainWidget(
      title: EnvApp.title,
      theme: ThemeApp.data,
      child: GithubRepoPage(
        getIt.get<GithubRepoListCubit>(),
        getIt.get<GithubPullListCubit>(),
        title: EnvApp.title,
      ),
    ),
  );
}
