import 'package:hive_flutter/hive_flutter.dart';

import 'cache_service.dart';

class CacheServiceHive implements CacheService {
  @override
  Future<void> create(String key, List<Map<String, dynamic>> data) async {
    final cacheBox = await Hive.openBox<List<Map<String, dynamic>>>('cacheBox');
    await cacheBox.put(key, data);
  }

  @override
  Future<List<Map<String, dynamic>>> read(String key) async {
    final cacheBox = await Hive.openBox<List<Map<String, dynamic>>>('cacheBox');
    return cacheBox.get(key) ?? [];
  }
}
