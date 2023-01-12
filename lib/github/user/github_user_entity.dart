class GithubUserEntity {
  const GithubUserEntity({
    required this.id,
    required this.username,
    required this.type,
    required this.avatarUrl,
  });

  final int id;
  final String username;
  final String type;
  final String avatarUrl;

  factory GithubUserEntity.fromMap(Map<String, dynamic> map) {
    return GithubUserEntity(
      id: map['id'] ?? 0,
      username: map['login'] ?? '',
      type: map['type'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
    );
  }
}
