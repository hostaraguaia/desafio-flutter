import 'package:desafio_flutter/github/pull/github_pull_entity.dart';
import 'package:desafio_flutter/github/pull/github_pull_model.dart';
import 'package:desafio_flutter/github/user/github_user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GithubUserEntity user;
  late GithubUserEntity emptyUser;
  late GithubPullEntity entity;
  late GithubPullEntity emptyEntity;

  setUpAll(() {
    user = const GithubUserEntity(id: 10, username: 'user', type: 'org', avatarUrl: 'https://google.com/profile.jpg');
    emptyUser = const GithubUserEntity(id: 0, username: '', type: '', avatarUrl: '');
    entity = GithubPullEntity(id: 54, title: 'Phasellus volutpat', body: 'Lorem ipsum dolor sit amet', state: 'open', user: user);
    emptyEntity = GithubPullEntity(id: 0, title: '', body: '', state: '', user: emptyUser);
  });

  test('should parse pull entity to pull model', () async {
    final model = GithubPullModel.fromEntity(entity);
    expect(model, isA<GithubPullModel>());
    expect(model.title, equals('Phasellus volutpat'));
  });

  test('should parse empty pull entity to empty pull model', () async {
    final model = GithubPullModel.fromEntity(emptyEntity);
    expect(model, isA<GithubPullModel>());
    expect(model.title, equals(''));
  });
}
