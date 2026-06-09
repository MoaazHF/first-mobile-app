import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../orders/views/orders_view.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/main_navigation_controller.dart';
import '../widgets/main_bottom_nav_bar.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    const pages = [SettingsView(), OrdersView(), HomeView()];

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: pages,
          ),
        ),
      ),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}
