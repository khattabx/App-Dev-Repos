// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/core/viewModel/control_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentscreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Explore',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Cart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
