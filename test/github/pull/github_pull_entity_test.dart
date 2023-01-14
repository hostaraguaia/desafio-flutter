import 'package:desafio_flutter/github/pull/github_pull_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> user;
  late Map<String, dynamic> emptyUser;
  late Map<String, dynamic> data;
  late Map<String, dynamic> emptyData;

  setUpAll(() {
    user = {'id': 10, 'login': 'user', 'type': 'org', 'avatar_url': 'https://google.com/profile.jpg'};
    emptyUser = {};
    data = {'id': 54, 'title': 'Phasellus volutpat', 'body': 'Lorem ipsum dolor sit amet', 'state': 'open', 'user': user};
    emptyData = {'user': emptyUser};
  });

  test('should parse map to pull entity', () async {
    final entity = GithubPullEntity.fromMap(data);
    expect(entity, isA<GithubPullEntity>());
    expect(entity.id, equals(54));
  });

  test('should parse empty map to empty pull entity', () async {
    final entity = GithubPullEntity.fromMap(emptyData);
    expect(entity, isA<GithubPullEntity>());
    expect(entity.id, equals(0));
  });
}
