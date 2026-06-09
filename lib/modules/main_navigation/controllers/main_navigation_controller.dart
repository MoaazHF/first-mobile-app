import 'package:get/get.dart';

class MainNavigationController extends GetxController {
  final selectedIndex = 2.obs;
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
