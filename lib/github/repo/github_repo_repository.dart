import '../../api/api_service.dart';
import '../../cache/cache_service.dart';
import 'github_repo_entity.dart';

abstract class GithubRepoRepository {
  const GithubRepoRepository(
    this.apiService,
    this.cacheService,
  );

  final ApiService apiService;
  final CacheService cacheService;

  Future<List<GithubRepoEntity>> readAll(String language, String perPage, String page);
}
