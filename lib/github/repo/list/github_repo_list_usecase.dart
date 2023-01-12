import '../github_repo_repository.dart';
import 'github_repo_list_input.dart';
import 'github_repo_list_output.dart';

abstract class GithubRepoListUsecase {
  const GithubRepoListUsecase(
    this.githubRepoRepository,
  );

  final GithubRepoRepository githubRepoRepository;

  Future<GithubRepoListOutput> execute(GithubRepoListInput input);
}
