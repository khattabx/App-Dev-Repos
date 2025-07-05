import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/core/viewModel/cart_viewmodel.dart';
import 'package:ecommerce_app/core/viewModel/control_view_model.dart';
import 'package:ecommerce_app/core/viewModel/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewmodel());
  }
}
