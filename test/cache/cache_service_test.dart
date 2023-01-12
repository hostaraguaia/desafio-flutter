import 'package:desafio_flutter/cache/cache_service.dart';
import 'package:desafio_flutter/cache/cache_service_hive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  late CacheService cacheService;

  setUpAll(() {
    Hive.init('test/cache');
    cacheService = CacheServiceHive();
  });

  tearDownAll(() {
    Hive.deleteFromDisk();
  });

  test('should handle cache successfully', () async {
    const shoppingCartKey = 'shopping_cart';
    final shoppingCartItems = [
      {'name': 'notebook'},
      {'name': 'mouse'},
    ];
    await cacheService.create(shoppingCartKey, shoppingCartItems);
    final shoppingCartData = await cacheService.read(shoppingCartKey);
    expect(shoppingCartData, isA<List<Map<String, dynamic>>>());
    expect(shoppingCartData, isNotEmpty);
    expect(shoppingCartData, equals(shoppingCartItems));
  });

  test('should handle cache failed', () async {
    const shoppingCartKey = 'shopping_cart';
    final shoppingCartItems = <Map<String, dynamic>>[];
    await cacheService.create(shoppingCartKey, shoppingCartItems);
    final shoppingCartData = await cacheService.read(shoppingCartKey);
    expect(shoppingCartData, isA<List<Map<String, dynamic>>>());
    expect(shoppingCartData, isEmpty);
  });
}
