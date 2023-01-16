import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import '../../mocks/git_rep_mocks.dart';

void main() {
  late http.Client client;

  setUp(() {
    client = MockClient();
    registerFallbackValue(Uri());
  });

  test('Should call the get method with correct URL', () async {
    String url =
        'https://api.github.com/search/repositories?q=language:java&sort=stars&order&page=1=desc';
    http.Response response = http.Response(gitRepDecode, 200);

    when(() => client.get(any())).thenAnswer((_) async => response);
    var result = await client.get(Uri.parse(url));

    expect(response, result);
  });
}
