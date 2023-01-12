import 'package:desafio_flutter/github/user/github_user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> data;
  late Map<String, dynamic> emptyData;

  setUpAll(() {
    data = {'id': 10, 'login': 'user', 'type': 'org', 'avatar_url': 'https://google.com/profile.jpg'};
    emptyData = {};
  });

  test('should parse map to entity', () async {
    final entity = GithubUserEntity.fromMap(data);
    expect(entity, isA<GithubUserEntity>());
    expect(entity.id, equals(10));
  });

  test('should parse empty map to entity', () async {
    final entity = GithubUserEntity.fromMap(emptyData);
    expect(entity, isA<GithubUserEntity>());
    expect(entity.id, equals(0));
  });
}
