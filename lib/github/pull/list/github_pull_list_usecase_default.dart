import '../github_pull_model.dart';
import 'github_pull_list_input.dart';
import 'github_pull_list_output.dart';
import 'github_pull_list_usecase.dart';

class GithubPullListUsecaseDefault extends GithubPullListUsecase {
  const GithubPullListUsecaseDefault(
    super.githubPullRepository,
  );

  @override
  Future<GithubPullListOutput> execute(GithubPullListInput input) async {
    final pulls = await githubPullRepository.readAll(input.repoName, input.state, input.perPage, input.page);
    return GithubPullListOutput(pulls: pulls.map(GithubPullModel.fromEntity).toList());
  }
}
