import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  void tappedIndex(int index) {
    selectedIndex.value = index;
  }
}
