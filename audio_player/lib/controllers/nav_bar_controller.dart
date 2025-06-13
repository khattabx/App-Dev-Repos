import 'package:get/get.dart';

class NavBarController extends GetxController {
  var selectedIndex = 1.obs;  // القيمة الافتراضية هي Home (الصفحة 1)

  void setSelectedIndex(int index) {
    selectedIndex.value = index;  // تغيير قيمة الـ selectedIndex
  }
}
