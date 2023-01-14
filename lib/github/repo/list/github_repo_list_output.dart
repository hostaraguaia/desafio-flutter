import '../github_repo_model.dart';

class GithubRepoListOutput {
  const GithubRepoListOutput({
    required this.repos,
  });

  final List<GithubRepoModel> repos;

  factory GithubRepoListOutput.empty() {
    return const GithubRepoListOutput(
      repos: [],
    );
  }
}
