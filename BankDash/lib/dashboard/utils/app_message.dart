import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomToast {
  static void showMessage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth >= 810;
    showTopSnackBar(
      Overlay.of(context),
      curve: Curves.fastEaseInToSlowEaseOut,
      displayDuration: const Duration(milliseconds: 800),
      snackBarPosition: SnackBarPosition.bottom,
      Material(
        color: Colors.transparent,
        child: Align(
          alignment: isMobile ? Alignment.bottomRight : Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xff282931),
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 25,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'This feature is in development, Stay tuned',
                    style: TextStyles.font16Bold(context).copyWith(
                      color: ColorsManager.bgColor,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
