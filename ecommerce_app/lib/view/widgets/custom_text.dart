import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.alignment,
    this.color = Colors.black,
    this.maxline,
    this.height = 1,
  });

  final String text;
  final double fontSize;
  final Color color;
  final Alignment? alignment;
  final int? maxline;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
        ),
        maxLines: maxline,
      ),
    );
  }
}
