import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ToastHelper {
  static void showTopNotification(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      curve: Curves.fastEaseInToSlowEaseOut,
      displayDuration: const Duration(milliseconds: 800),
      Material(
        color: Colors.transparent,
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xff282931),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
