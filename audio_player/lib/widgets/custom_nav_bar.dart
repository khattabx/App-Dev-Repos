import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/colors.dart';
import '../controllers/dialog_contact.dart';
import '../controllers/nav_bar_controller.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.put(NavBarController());
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.3;

    return Container(
      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                navBarController.setSelectedIndex(0);
                Get.snackbar(
                  "Playlists",
                  "This section is currently being developed. Stay tuned for updates!",
                  colorText: Colors.white,
                  isDismissible: true,
                  animationDuration: const Duration(milliseconds: 400),
                  onTap: (snack) {
                    DialogHelper.showLinkDialog(
                      url: 'https://linktr.ee/userahmed',
                      title: 'For updates, contact the developer here.',
                    );
                  },
                );
              },
              child: Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: navBarController.selectedIndex.value == 0
                        ? whiteColor
                        : whiteColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 55,
                  width: containerWidth,
                  child: Center(
                    child: Text(
                      'Playlists',
                      style: TextStyle(
                        fontSize: 16,
                        color: navBarController.selectedIndex.value == 0
                            ? bgDarkColor
                            : whiteColor,
                        fontFamily: 'bold',
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                navBarController.setSelectedIndex(1);
              },
              child: Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: navBarController.selectedIndex.value == 1
                        ? whiteColor
                        : whiteColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 55,
                  width: containerWidth,
                  child: Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 16,
                        color: navBarController.selectedIndex.value == 1
                            ? bgDarkColor
                            : whiteColor,
                        fontFamily: 'bold',
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                navBarController.setSelectedIndex(2);
                Get.snackbar(
                  "Albums",
                  "This section is currently being developed. Stay tuned for updates!",
                  colorText: Colors.white,
                  isDismissible: true,
                  animationDuration: const Duration(milliseconds: 400),
                  onTap: (snack) {
                    DialogHelper.showLinkDialog(
                      url: 'https://linktr.ee/userahmed',
                      title: 'For updates, contact the developer here.',
                    );
                  },
                );
              },
              child: Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: navBarController.selectedIndex.value == 2
                        ? whiteColor
                        : whiteColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 55,
                  width: containerWidth,
                  child: Center(
                    child: Text(
                      'Albums',
                      style: TextStyle(
                        fontSize: 16,
                        color: navBarController.selectedIndex.value == 2
                            ? bgDarkColor
                            : whiteColor,
                        fontFamily: 'bold',
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
