import '../github_pull_model.dart';

class GithubPullListOutput {
  const GithubPullListOutput({
    required this.pulls,
  });

  final List<GithubPullModel> pulls;

  factory GithubPullListOutput.empty() {
    return const GithubPullListOutput(
      pulls: [],
    );
  }
}
