import '../user/github_user_model.dart';
import 'github_pull_entity.dart';

class GithubPullModel {
  const GithubPullModel({
    required this.title,
    required this.body,
    required this.state,
    required this.user,
  });

  final String title;
  final String body;
  final String state;
  final GithubUserModel user;

  factory GithubPullModel.fromEntity(GithubPullEntity entity) {
    return GithubPullModel(
      title: entity.title,
      body: entity.body,
      state: entity.state,
      user: GithubUserModel.fromEntity(entity.user),
    );
  }
}
