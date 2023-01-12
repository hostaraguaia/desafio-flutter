import 'package:dio/dio.dart';

import 'github_repo_entity.dart';
import 'github_repo_repository.dart';

class GithubRepoRepositoryDefault extends GithubRepoRepository {
  const GithubRepoRepositoryDefault(
    super.cacheService,
  );

  @override
  Future<List<GithubRepoEntity>> readAll(String language, String perPage, String page) async {
    final url = 'https://api.github.com/search/repositories?q=language:$language&sort=stars&direction=desc&&per_page=$perPage&page=$page';
    final cache = await cacheService.read(url);
    if (cache.isNotEmpty) return cache.map(GithubRepoEntity.fromMap).toList();
    final dio = Dio();
    final response = await dio.get(url);
    final responseData = Map<String, dynamic>.from(response.data ?? {});
    final data = List<Map<String, dynamic>>.from(responseData.isEmpty ? [] : responseData['items']);
    await cacheService.create(url, data);
    return data.map(GithubRepoEntity.fromMap).toList();
  }
}
