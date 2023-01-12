import '../../../common/common_state.dart';
import 'github_pull_list_output.dart';

class GithubPullListState extends CommonState<GithubPullListOutput> {
  const GithubPullListState(
    super.type,
    super.message,
    super.output,
  );

  factory GithubPullListState.initial() => GithubPullListState(StateType.initial, '', GithubPullListOutput.empty());
  factory GithubPullListState.loading() => GithubPullListState(StateType.loading, '', GithubPullListOutput.empty());
  factory GithubPullListState.failure(String message) => GithubPullListState(StateType.failure, message, GithubPullListOutput.empty());
  factory GithubPullListState.success(GithubPullListOutput output) => GithubPullListState(StateType.success, '', output);
}
