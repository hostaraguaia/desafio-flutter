import 'dart:convert';

import 'package:core/data/models/git_rep_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/git_rep_mocks.dart';

void main() {
  late GitRepModel model;
  late Map<dynamic, dynamic> map;
  setUp(() {
    model = gitRepModelMock;
    map = gitRepMockMap();
  });
  group('GitRep Test', (() {
    test('Should return GitRep fromMap', () {
      final fromMap = GitRepModel.fromMap(jsonDecode(gitRepDecode));
      expect(model, fromMap);
    });

    test('Should return GitRep toMap', () {
      expect(map, model.toMap());
    });
  }));
}
