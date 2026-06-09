import 'package:flutter_test/flutter_test.dart';
import 'package:robin_food_practice/modules/home/data/models/nearby_store.dart';

void main() {
  group('NearbyStore.fromJson', () {
    test('maps API fields into the model', () {
      final store = NearbyStore.fromJson({
        'id': 12,
        'partnerName': 'Robin Partner',
        'storeName': 'Robin Store',
        'distance': '3.5',
        'imageUrl': 'image',
        'coverImageUrl': 'cover',
        'productImageUrl': 'product',
        'duration': '20 min',
      });

      expect(store.id, '12');
      expect(store.partnerName, 'Robin Partner');
      expect(store.storeName, 'Robin Store');
      expect(store.distance, 3.5);
      expect(store.imageUrl, 'image');
      expect(store.coverImageUrl, 'cover');
      expect(store.productImageUrl, 'product');
      expect(store.duration, '20 min');
    });

    test('handles missing optional values', () {
      final store = NearbyStore.fromJson(const {});

      expect(store.id, isEmpty);
      expect(store.partnerName, isEmpty);
      expect(store.storeName, isEmpty);
      expect(store.distance, isNull);
      expect(store.imageUrl, isNull);
    });
  });
}
