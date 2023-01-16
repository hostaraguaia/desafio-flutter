import 'package:core/data/datasources/git_rep_datasource.dart';
import 'package:core/data/models/git_rep_model.dart';
import 'package:core/domain/entities/git_rep.dart';
import 'package:core/domain/repositories/git_rep_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockGitRepRepository extends Mock implements GitRepRepository {}

class MockGitRepDataSource extends Mock implements GitRepDataSource {}

class MockClient extends Mock implements http.Client {}

const GitRepModel gitRepModelMock = GitRepModel(
  name: 'FoldableLayout',
  description: 'Android widgets to implement folding animation',
  userName: 'alexvasilkov',
  avatarURL: 'https://avatars.githubusercontent.com/u/3725494?v=4',
  htmlURL: 'https://github.com/alexvasilkov',
  starCount: 1664,
  fork: 363,
);

gitRepMockMap() {
  return {
    "name": "FoldableLayout",
    "description": "Android widgets to implement folding animation",
    "owner": {
      "login": "alexvasilkov",
      "avatar_url": "https://avatars.githubusercontent.com/u/3725494?v=4"
    },
    "html_url": "https://github.com/alexvasilkov",
    "stargazers_count": 1664,
    "forks_count": 363
  };
}

List<GitRep> gitRepEntityMockList() {
  return [
    const GitRep(
      name: 'name',
      description: 'description',
      userName: 'userName',
      avatarURL: 'avatarURL',
      htmlURL: 'htmlURL',
      starCount: 5,
      fork: 3,
    )
  ];
}

const gitRepDecode = """
{
    "name": "FoldableLayout",
    "description": "Android widgets to implement folding animation",
    "owner": {
      "login": "alexvasilkov",
      "avatar_url": "https://avatars.githubusercontent.com/u/3725494?v=4"
    },
    "html_url": "https://github.com/alexvasilkov",
    "stargazers_count": 1664,
    "forks_count": 363
}
""";
