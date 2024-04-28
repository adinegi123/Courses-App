import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;
  var argument = Get.arguments;

  @override
  void onInit() {
    tabIndex.value = argument ?? 0;
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
