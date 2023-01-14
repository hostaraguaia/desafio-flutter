import 'package:desafio_flutter/github/repo/github_repo_entity.dart';
import 'package:desafio_flutter/github/repo/github_repo_model.dart';
import 'package:desafio_flutter/github/user/github_user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GithubUserEntity user;
  late GithubUserEntity emptyUser;
  late GithubRepoEntity entity;
  late GithubRepoEntity emptyEntity;

  setUpAll(() {
    user = const GithubUserEntity(id: 10, username: 'user', type: 'org', avatarUrl: 'https://google.com/profile.jpg');
    emptyUser = const GithubUserEntity(id: 0, username: '', type: '', avatarUrl: '');
    entity = GithubRepoEntity(id: 54, name: 'Phasellus volutpat', description: 'Lorem ipsum dolor sit amet', forks: 14, stars: 5, user: user);
    emptyEntity = GithubRepoEntity(id: 0, name: '', description: '', forks: 0, stars: 0, user: emptyUser);
  });

  test('should parse repo entity to repo model', () async {
    final model = GithubRepoModel.fromEntity(entity);
    expect(model, isA<GithubRepoModel>());
    expect(model.name, equals('Phasellus volutpat'));
  });

  test('should parse empty repo entity to empty repo model', () async {
    final model = GithubRepoModel.fromEntity(emptyEntity);
    expect(model, isA<GithubRepoModel>());
    expect(model.name, equals(''));
  });
}
