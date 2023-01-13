import '../../api/api_service.dart';
import '../../cache/cache_service.dart';
import 'github_pull_entity.dart';

abstract class GithubPullRepository {
  const GithubPullRepository(
    this.apiService,
    this.cacheService,
  );

  final ApiService apiService;
  final CacheService cacheService;

  Future<List<GithubPullEntity>> readAll(String repoName, String state, String perPage, String page);
}
