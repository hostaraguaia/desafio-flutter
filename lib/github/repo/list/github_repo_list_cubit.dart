import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'github_repo_list_input.dart';
import 'github_repo_list_state.dart';
import 'github_repo_list_usecase.dart';

class GithubRepoListCubit extends Cubit<GithubRepoListState> {
  GithubRepoListCubit(
    this.githubRepoListUsecase,
  ) : super(GithubRepoListState.initial());

  final GithubRepoListUsecase githubRepoListUsecase;

  void execute(GithubRepoListInput input) async {
    try {
      emit(GithubRepoListState.loading());
      final output = await githubRepoListUsecase.execute(input);
      emit(GithubRepoListState.success(output));
    } on DioError catch (e) {
      emit(GithubRepoListState.failure(e.message));
    }
  }
}
