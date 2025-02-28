// ignore_for_file: sized_box_for_whitespace

import 'package:ecommerce_app/constant.dart';
import 'package:flutter/material.dart';

class MainBotton extends StatelessWidget {
  const MainBotton({
    super.key,
    required this.text,
    this.color = kPrimaryColor,
    required this.onPressed,
    this.width,
    this.txtColor,
    this.fontSize,
  });

  final String text;
  final Color color;
  final Color? txtColor;
  final double? fontSize;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: txtColor, fontSize: fontSize),
        ),
      ),
    );
  }
}
