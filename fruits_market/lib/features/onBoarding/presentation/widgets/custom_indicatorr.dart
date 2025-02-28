import 'package:flutter/material.dart';
import '/core/constants/consttants.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CustomIndicatorr extends StatelessWidget {
  const CustomIndicatorr({super.key, required this.dotIndex});
  final double? dotIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: DotsIndicator(
        key: ValueKey<int>(
          (dotIndex ?? 0.0).toInt(),
        ),
        decorator: DotsDecorator(
          activeColor: kMainColor,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: kMainColor),
          ),
        ),
        dotsCount: 3,
        position: (dotIndex ?? 0.0).toInt(),
      ),
    );
  }
}
