import 'package:dio/dio.dart';

import 'github_pull_entity.dart';
import 'github_pull_repository.dart';

class GithubPullRepositoryDefault extends GithubPullRepository {
  const GithubPullRepositoryDefault(
    super.cacheService,
  );

  @override
  Future<List<GithubPullEntity>> readAll(String repoName, String state, String perPage, String page) async {
    final url = 'https://api.github.com/repos/$repoName/pulls?state=$state&sort=newest&direction=desc&per_page=$perPage&page=$page';
    final cache = await cacheService.read(url);
    if (cache.isNotEmpty) return cache.map(GithubPullEntity.fromMap).toList();
    final dio = Dio();
    final response = await dio.get(url);
    final data = List<Map<String, dynamic>>.from(response.data ?? {});
    await cacheService.create(url, data);
    return data.map(GithubPullEntity.fromMap).toList();
  }
}
