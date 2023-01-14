abstract class CacheService {
  Future<void> create(String key, List<Map<String, dynamic>> data);
  Future<List<Map<String, dynamic>>> read(String key);
}
