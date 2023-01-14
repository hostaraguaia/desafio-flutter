import 'package:desafio_flutter/github/user/github_user_entity.dart';
import 'package:desafio_flutter/github/user/github_user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GithubUserEntity entity;
  late GithubUserEntity emptyEntity;

  setUpAll(() {
    entity = const GithubUserEntity(id: 10, username: 'user', type: 'org', avatarUrl: 'https://www.google.com/profile.jpg');
    emptyEntity = const GithubUserEntity(id: 0, username: '', type: '', avatarUrl: '');
  });

  test('should parse user entity to user model', () async {
    final model = GithubUserModel.fromEntity(entity);
    expect(model, isA<GithubUserModel>());
    expect(model.username, equals('user'));
  });

  test('should parse empty user entity to empty user model', () async {
    final model = GithubUserModel.fromEntity(emptyEntity);
    expect(model, isA<GithubUserModel>());
    expect(model.username, equals(''));
  });
}
