import '../user/github_user_model.dart';
import 'github_repo_entity.dart';

class GithubRepoModel {
  const GithubRepoModel({
    required this.name,
    required this.description,
    required this.forks,
    required this.stars,
    required this.user,
  });

  final String name;
  final String description;
  final String forks;
  final String stars;
  final GithubUserModel user;

  factory GithubRepoModel.fromEntity(GithubRepoEntity entity) {
    return GithubRepoModel(
      name: entity.name,
      description: entity.description,
      forks: entity.forks.toString(),
      stars: entity.stars.toString(),
      user: GithubUserModel.fromEntity(entity.user),
    );
  }
}
