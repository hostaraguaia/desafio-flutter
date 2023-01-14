import '../github_repo_model.dart';
import 'github_repo_list_input.dart';
import 'github_repo_list_output.dart';
import 'github_repo_list_usecase.dart';

class GithubRepoListUsecaseDefault extends GithubRepoListUsecase {
  const GithubRepoListUsecaseDefault(
    super.githubRepoRepository,
  );

  @override
  Future<GithubRepoListOutput> execute(GithubRepoListInput input) async {
    final repos = await githubRepoRepository.readAll(input.language, input.count, input.page);
    return GithubRepoListOutput(repos: repos.map(GithubRepoModel.fromEntity).toList());
  }
}
