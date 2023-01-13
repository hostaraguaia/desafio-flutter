import '../user/github_user_entity.dart';

class GithubPullEntity {
  const GithubPullEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.state,
    required this.user,
  });

  final int id;
  final String title;
  final String body;
  final String state;
  final GithubUserEntity user;

  factory GithubPullEntity.fromMap(Map<String, dynamic> map) {
    return GithubPullEntity(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      state: map['state'] ?? '',
      user: GithubUserEntity.fromMap(map['user'] ?? {}),
    );
  }
}
