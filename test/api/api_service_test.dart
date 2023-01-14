import 'package:desafio_flutter/api/api_service.dart';
import 'package:desafio_flutter/api/api_service_error.dart';
import 'package:desafio_flutter/api/api_service_github.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApiService apiService;

  setUpAll(() {
    apiService = ApiServiceGithub();
  });

  test('should return a list of repositories C language', () async {
    final response = await apiService.request('get', '/search/repositories?q=language:c', {}, {});
    final data = Map<String, dynamic>.from(response);
    expect(data, isA<Map<String, dynamic>>());
    expect(data, isNotEmpty);
  });

  test('should not return a list of repositories C language', () async {
    final response = apiService.request('get', '/search/repositories', {}, {});
    expect(response, throwsA(isA<ApiServiceError>()));
  });
}
