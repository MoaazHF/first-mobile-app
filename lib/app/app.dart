import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/data/services/store_api_service.dart';
import '../modules/main_navigation/controllers/main_navigation_controller.dart';
import '../modules/main_navigation/views/main_navigation_view.dart';

class RobinFoodApp extends StatelessWidget {
  const RobinFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Robin Food',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<StoreApiService>(StoreApiService.new);
        Get.lazyPut<HomeController>(
          () => HomeController(storeApiService: Get.find()),
        );
        Get.lazyPut<MainNavigationController>(MainNavigationController.new);
      }),
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      home: const MainNavigationView(),
    );
  }
}
