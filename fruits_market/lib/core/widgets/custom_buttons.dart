import 'package:flutter/material.dart';
import 'package:fruits_market/core/constants/consttants.dart';
import 'package:fruits_market/core/utlis/size_config.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
// import 'package:get/get.dart';

class CustomGeneralButtons extends StatelessWidget {
  const CustomGeneralButtons({super.key, required this.text, this.onTap});
  final String? text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: kMainColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcons extends StatelessWidget {
  const CustomButtonWithIcons(
      {super.key, required this.text, this.iconData, this.onTap, this.color});

  final String text;
  final IconData? iconData;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF707070)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            const HorizintalSpace(2),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
