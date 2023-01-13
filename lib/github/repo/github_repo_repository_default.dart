import 'github_repo_entity.dart';
import 'github_repo_repository.dart';

class GithubRepoRepositoryDefault extends GithubRepoRepository {
  const GithubRepoRepositoryDefault(
    super.apiService,
    super.cacheService,
  );

  @override
  Future<List<GithubRepoEntity>> readAll(String language, String perPage, String page) async {
    final path = '/search/repositories?q=language:$language&sort=stars&direction=desc&&per_page=$perPage&page=$page';
    final cache = await cacheService.read(path);
    if (cache.isNotEmpty) return cache.map(GithubRepoEntity.fromMap).toList();
    final response = await apiService.request('get', path, {}, {});
    final data = List<Map<String, dynamic>>.from(response.isEmpty ? [] : response['items']);
    await cacheService.create(path, data);
    return data.map(GithubRepoEntity.fromMap).toList();
  }
}
