import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'restaurant_card.dart';

class RestaurantsSection extends GetView<HomeController> {
  const RestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Restaurants'),
        const SizedBox(height: 12),
        Obx(() {
          if (controller.isLoadingStores.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.storesError.value != null) {
            return Text(
              controller.storesError.value!,
              style: const TextStyle(color: Colors.red),
            );
          }

          if (controller.stores.isEmpty) {
            return const Text('No nearby stores found.');
          }

          return ListView.builder(
            itemCount: controller.stores.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RestaurantCard(store: controller.stores[index]);
            },
          );
        }),
      ],
    );
  }
}
