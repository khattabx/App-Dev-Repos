import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final bool isDrawerOpen;
  final VoidCallback onDrawerToggle;

  CustomAppBar({
    Key? key,
    required this.isDrawerOpen,
    required this.onDrawerToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onDrawerToggle,
        icon: isDrawerOpen
            ? const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )
            : SvgPicture.asset(
                width: 20,
                height: 20,
                'assets/icons/drawer.svg',
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
      ),
      title: Text(
        'Audira',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'bold',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.snackbar(
              "In Progress",
              "This feature is currently being developed. Stay tuned!",
              colorText: Colors.white,
              icon: const Icon(Icons.code_rounded, color: Colors.green),
              isDismissible: true,
              animationDuration: const Duration(milliseconds: 400),
            );
          },
          icon: SvgPicture.asset(
            width: 22,
            height: 22,
            'assets/icons/setting.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
