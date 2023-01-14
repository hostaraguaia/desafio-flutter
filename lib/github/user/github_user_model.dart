import 'github_user_entity.dart';

class GithubUserModel {
  const GithubUserModel({
    required this.username,
    required this.type,
    required this.avatarUrl,
  });

  final String username;
  final String type;
  final String avatarUrl;

  factory GithubUserModel.fromEntity(GithubUserEntity entity) {
    return GithubUserModel(
      username: entity.username,
      type: entity.type,
      avatarUrl: entity.avatarUrl,
    );
  }
}
