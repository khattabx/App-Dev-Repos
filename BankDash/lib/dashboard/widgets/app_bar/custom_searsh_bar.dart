import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearshBar extends StatelessWidget {
  const CustomSearshBar({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth >= 810;
    return SizedBox(
      width: isMobile ? 300 : 400,
      child: TextField(
        style: TextStyles.font15Regular(context).copyWith(
          color: Colors.black,
        ),
        cursorColor: ColorsManager.mainBlue,
        decoration: InputDecoration(
          filled: true,
          fillColor: color ?? ColorsManager.bgColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: isMobile
                  ? ColorsManager.bgColor
                  : ColorsManager.borderSideColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: isMobile
                  ? ColorsManager.bgColor
                  : ColorsManager.borderSideColor,
            ),
          ),
          prefixIcon: SvgPicture.asset(
            AppImages.search,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          hintText: 'Search for something',
          hintStyle: TextStyles.font15Regular(context).copyWith(
            color: ColorsManager.secondaryTxtColor,
          ),
        ),
      ),
    );
  }
}
