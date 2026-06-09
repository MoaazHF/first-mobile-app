import 'package:flutter_test/flutter_test.dart';
import 'package:robin_food_practice/modules/home/controllers/home_controller.dart';
import 'package:robin_food_practice/modules/home/data/models/nearby_store.dart';
import 'package:robin_food_practice/modules/home/data/services/store_api_service.dart';

class FakeStoreApiService extends StoreApiService {
  FakeStoreApiService({this.stores = const [], this.error});

  final List<NearbyStore> stores;
  final Object? error;

  @override
  Future<List<NearbyStore>> getNearbyStores({
    required double latitude,
    required double longitude,
  }) async {
    if (error != null) {
      throw error!;
    }
    return stores;
  }
}

void main() {
  group('HomeController', () {
    test('changes the selected navigation index', () {
      final controller = HomeController(storeApiService: FakeStoreApiService());

      controller.changeBottomNavIndex(1);

      expect(controller.bottomNavIndex.value, 1);
    });

    test('loads nearby stores from the service', () async {
      const stores = [
        NearbyStore(id: '1', partnerName: 'Partner', storeName: 'Store'),
      ];
      final controller = HomeController(
        storeApiService: FakeStoreApiService(stores: stores),
      );

      await controller.fetchNearbyStores();

      expect(controller.stores, orderedEquals(stores));
      expect(controller.storesError.value, isNull);
      expect(controller.isLoadingStores.value, isFalse);
    });

    test('exposes service failures to the view', () async {
      final controller = HomeController(
        storeApiService: FakeStoreApiService(
          error: Exception('request failed'),
        ),
      );

      await controller.fetchNearbyStores();

      expect(controller.stores, isEmpty);
      expect(controller.storesError.value, contains('request failed'));
      expect(controller.isLoadingStores.value, isFalse);
    });
  });
}
