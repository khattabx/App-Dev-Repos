import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../controllers/player_controller.dart';
import '../widgets/custom_nav_bar.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: bgDarkColor,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Scaffold(
          appBar: appBar(),
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              CustomNavBar(),
              Expanded(
                child: Center(
                  child: Text(
                    'This section is currently being developed. \nStay tuned for updates!',
                    style:
                        ourStyle(family: regular, color: whiteColor, size: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  AppBar appBar() {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (isDrawerOpen) {
                xOffset = 0;
                yOffset = 0;
                isDrawerOpen = false;
              } else {
                xOffset = 290;
                yOffset = 80;
                isDrawerOpen = true;
              }
            });
          },
          icon: isDrawerOpen
              ? const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: iconsColor,
                )
              : SvgPicture.asset(
                  width: 20,
                  height: 20,
                  'assets/icons/drawer.svg',
                  colorFilter:
                      const ColorFilter.mode(iconsColor, BlendMode.srcIn),
                ),
        ),
        title: Text(
          'Audira',
          style: TextStyle(
            fontSize: 30,
            color: whiteColor,
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
              colorFilter:
                  const ColorFilter.mode(iconsColor, BlendMode.srcIn),
            ),
          )
        ],
      );
  }
}
