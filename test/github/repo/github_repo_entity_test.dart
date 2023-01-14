import 'package:desafio_flutter/github/repo/github_repo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> user;
  late Map<String, dynamic> emptyUser;
  late Map<String, dynamic> data;
  late Map<String, dynamic> emptyData;

  setUpAll(() {
    user = {'id': 10, 'login': 'user', 'type': 'org', 'avatar_url': 'https://google.com/profile.jpg'};
    emptyUser = {};
    data = {'id': 54, 'full_name': 'Phasellus volutpat', 'description': 'Lorem ipsum dolor sit amet', 'forks_count': 14, 'stargazers_count': 5, 'owner': user};
    emptyData = {'owner': emptyUser};
  });

  test('should parse map to repo entity', () async {
    final entity = GithubRepoEntity.fromMap(data);
    expect(entity, isA<GithubRepoEntity>());
    expect(entity.id, equals(54));
  });

  test('should parse empty map to empty repo entity', () async {
    final entity = GithubRepoEntity.fromMap(emptyData);
    expect(entity, isA<GithubRepoEntity>());
    expect(entity.id, equals(0));
  });
}
