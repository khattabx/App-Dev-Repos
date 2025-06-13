import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';

class DialogHelper {
  static void showLinkDialog({
    required String url,
    required String title,
  }) {
    Get.defaultDialog(
      title: "Open Link",
      middleText: title,
      backgroundColor: whiteColor,
      titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      middleTextStyle: const TextStyle(fontSize: 14),
      radius: 10,
      actions: [
        ElevatedButton(
          onPressed: () async {
            try {
              // ignore: deprecated_member_use
              await launch(
                url,
                // Removed CustomTabsOption as it is not defined
              );
            } catch (e) {
              Get.snackbar(
                "Error",
                "Could not launch $url",
                colorText: Colors.white,
                icon: const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                ),
                isDismissible: true,
                animationDuration: const Duration(milliseconds: 400),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            elevation: 0,
          ),
          child: Text(
            "Open Link",
            style: ourStyle(color: whiteColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: ourStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
