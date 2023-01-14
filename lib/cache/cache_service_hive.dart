import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'cache_service.dart';
import 'cache_service_error.dart';

class CacheServiceHive implements CacheService {
  Future<Box<dynamic>> get _openBox async => await Hive.openBox('cacheBox');
  String _generateKey(String key) => base64.encode(key.codeUnits);

  @override
  Future<void> create(String key, List<Map<String, dynamic>> data) async {
    try {
      final cacheBox = await _openBox;
      final cacheKey = _generateKey(key);
      cacheBox.put(cacheKey, data);
    } catch (e) {
      throw CacheServiceError(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> read(String key) async {
    try {
      final cacheBox = await _openBox;
      final cacheKey = _generateKey(key);
      final data = json.encode(cacheBox.get(cacheKey) ?? []);
      return List<Map<String, dynamic>>.from(json.decode(data));
    } catch (e) {
      throw CacheServiceError(e.toString());
    }
  }
}
