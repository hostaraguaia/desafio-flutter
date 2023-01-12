class GithubPullListInput {
  const GithubPullListInput(
    this.repoName,
    this.state,
    this.perPage,
    this.page,
  );

  final String repoName;
  final String state;
  final String perPage;
  final String page;
}
