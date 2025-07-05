import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/app_message.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:bankdash/dashboard/widgets/app_bar/custom_searsh_bar.dart';
import 'package:bankdash/dashboard/widgets/app_bar/rounded_icons_container.dart';
import 'package:bankdash/dashboard/widgets/app_bar/rounded_image_container.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
     this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1091;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorsManager.borderSideColor,
                  width: 1.5,
                ),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: isDesktop ? 30 : 15.0),
                  child: Row(
                    children: [
                      if (!isDesktop)
                        GestureDetector(
                          onTap: onTap,
                          child: const Icon(
                            Icons.menu_rounded,
                            size: 30,
                            color: ColorsManager.primaryTxtColor,
                          ),
                        ),
                      SizedBox(width: isDesktop ? 0 : 10),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Overview',
                          style: TextStyles.font28SemiBold(context).copyWith(
                            color: ColorsManager.primaryTxtColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomSearshBar(),
                      const SizedBox(width: 30),
                      RoundedIconsContainer(
                        onTap: () => CustomToast.showMessage(context),
                        svgImage: AppImages.settings,
                      ),
                      const SizedBox(width: 30),
                      RoundedIconsContainer(
                        onTap: () => CustomToast.showMessage(context),
                        svgImage: AppImages.notification,
                      ),
                      const SizedBox(width: 30),
                      RoundedImageContainer(
                        onTap: () => CustomToast.showMessage(context),
                        image: AppImages.user1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
