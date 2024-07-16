import 'package:get/get.dart';

class NavBarController extends GetxController {
  var tabIndex = 0;

  NavBarController({int initialIndex = 0}) {
    tabIndex = initialIndex;
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
