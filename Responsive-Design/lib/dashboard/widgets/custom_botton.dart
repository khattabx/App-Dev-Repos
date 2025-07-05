import 'package:dashboard/dashboard/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.onTap,
    this.textColor,
  });
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          backgroundColor: backgroundColor ?? const Color(0xFF4DB7F2),
        ),
        child: FittedBox(
          child: Text(
            title,
            style:
                AppStyles.styleSemiBold18(context).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
