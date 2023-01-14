import 'github_pull_entity.dart';
import 'github_pull_repository.dart';

class GithubPullRepositoryDefault extends GithubPullRepository {
  const GithubPullRepositoryDefault(
    super.apiService,
    super.cacheService,
  );

  @override
  Future<List<GithubPullEntity>> readAll(String repoName, String state, String perPage, String page) async {
    final path = '/repos/$repoName/pulls?state=$state&sort=newest&direction=desc&per_page=$perPage&page=$page';
    final cache = await cacheService.read(path);
    if (cache.isNotEmpty) return cache.map(GithubPullEntity.fromMap).toList();
    final response = await apiService.request('get', path, {}, {});
    final data = List<Map<String, dynamic>>.from(response);
    await cacheService.create(path, data);
    return data.map(GithubPullEntity.fromMap).toList();
  }
}
