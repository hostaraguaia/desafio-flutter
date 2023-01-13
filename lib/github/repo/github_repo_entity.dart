import '../user/github_user_entity.dart';

class GithubRepoEntity {
  const GithubRepoEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.forks,
    required this.stars,
    required this.user,
  });

  final int id;
  final String name;
  final String description;
  final int forks;
  final int stars;
  final GithubUserEntity user;

  factory GithubRepoEntity.fromMap(Map<String, dynamic> map) {
    return GithubRepoEntity(
      id: map['id'] ?? 0,
      name: map['full_name'] ?? '',
      description: map['description'] ?? '',
      forks: map['forks_count'] ?? 0,
      stars: map['stargazers_count'] ?? 0,
      user: GithubUserEntity.fromMap(map['owner'] ?? {}),
    );
  }
}
