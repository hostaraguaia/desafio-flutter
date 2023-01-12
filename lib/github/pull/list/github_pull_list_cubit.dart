import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'github_pull_list_input.dart';
import 'github_pull_list_state.dart';
import 'github_pull_list_usecase.dart';

class GithubPullListCubit extends Cubit<GithubPullListState> {
  GithubPullListCubit(
    this.githubPullListUsecase,
  ) : super(GithubPullListState.initial());

  final GithubPullListUsecase githubPullListUsecase;

  void execute(GithubPullListInput input) async {
    try {
      emit(GithubPullListState.loading());
      final output = await githubPullListUsecase.execute(input);
      emit(GithubPullListState.success(output));
    } on DioError catch (e) {
      emit(GithubPullListState.failure(e.message));
    }
  }
}
