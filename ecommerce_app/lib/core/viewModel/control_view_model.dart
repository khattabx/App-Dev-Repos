import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  Widget _currentscreen = HomeView();
  get currentscreen => _currentscreen;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentscreen = HomeView();
          break;
        }
      case 1:
        {
          _currentscreen = CartView();
          break;
        }
      case 2:
        {
          _currentscreen = const ProfileView();
          break;
        }
    }
    update();
  }
}
