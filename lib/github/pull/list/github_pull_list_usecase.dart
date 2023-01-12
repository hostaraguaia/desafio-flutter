import '../github_pull_repository.dart';
import 'github_pull_list_input.dart';
import 'github_pull_list_output.dart';

abstract class GithubPullListUsecase {
  const GithubPullListUsecase(
    this.githubPullRepository,
  );

  final GithubPullRepository githubPullRepository;

  Future<GithubPullListOutput> execute(GithubPullListInput input);
}
