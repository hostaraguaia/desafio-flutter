import '../../../common/common_state.dart';
import 'github_repo_list_output.dart';

class GithubRepoListState extends CommonState<GithubRepoListOutput> {
  const GithubRepoListState(
    super.type,
    super.message,
    super.output,
  );

  factory GithubRepoListState.initial() => GithubRepoListState(StateType.initial, '', GithubRepoListOutput.empty());
  factory GithubRepoListState.loading() => GithubRepoListState(StateType.loading, '', GithubRepoListOutput.empty());
  factory GithubRepoListState.failure(String message) => GithubRepoListState(StateType.failure, message, GithubRepoListOutput.empty());
  factory GithubRepoListState.success(GithubRepoListOutput output) => GithubRepoListState(StateType.success, '', output);
}
