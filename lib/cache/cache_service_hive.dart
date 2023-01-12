import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'cache_service.dart';

class CacheServiceHive implements CacheService {
  @override
  Future<void> create(String key, List<Map<String, dynamic>> data) async {
    final cacheBox = await Hive.openBox('cacheBox');
    final cacheKey = base64.encode(key.codeUnits);
    cacheBox.put(cacheKey, data);
  }

  @override
  Future<List<Map<String, dynamic>>> read(String key) async {
    final cacheBox = await Hive.openBox('cacheBox');
    final cacheKey = base64.encode(key.codeUnits);
    final data = json.encode(cacheBox.get(cacheKey) ?? []);
    return List<Map<String, dynamic>>.from(json.decode(data));
  }
}
