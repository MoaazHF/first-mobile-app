import 'package:get/get.dart';

import '../data/models/food_category.dart';
import '../data/models/nearby_store.dart';
import '../data/services/store_api_service.dart';

class HomeController extends GetxController {
  HomeController({required StoreApiService storeApiService})
    : _storeApiService = storeApiService;

  final StoreApiService _storeApiService;

  final stores = <NearbyStore>[].obs;
  final isLoadingStores = false.obs;
  final storesError = RxnString();

  final categories = const <FoodCategory>[
    FoodCategory(name: 'Pizza', imagePath: 'assets/images/pizza.png'),
    FoodCategory(name: 'Burger', imagePath: 'assets/images/burger.jpeg'),
    FoodCategory(name: 'Drinks', imagePath: 'assets/images/drink.png'),
    FoodCategory(name: 'Desserts', imagePath: 'assets/images/dessert.png'),
    FoodCategory(name: 'Fish', imagePath: 'assets/images/fish.jpg'),
  ];

  static const double _defaultLatitude = 21.47301230956007;
  static const double _defaultLongitude = 39.934998997969466;

  @override
  void onInit() {
    super.onInit();
    fetchNearbyStores();
  }


  Future<void> fetchNearbyStores() async {
    try {
      isLoadingStores.value = true;
      storesError.value = null;
      final fetchedStores = await _storeApiService.getNearbyStores(
        latitude: _defaultLatitude,
        longitude: _defaultLongitude,
      );
      stores.assignAll(fetchedStores);
    } catch (e) {
      storesError.value = e.toString();
    } finally {
      isLoadingStores.value = false;
    }
  }
}
