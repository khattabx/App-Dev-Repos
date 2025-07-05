import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class MyCard extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String title;

  const MyCard({
    super.key,
    required this.isActive,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    /// This method is applied only on min width for tablet layout,
    /// to fix the overflow issue for svg icons.
    final upperLimit = (screenWidth >= 811 && screenWidth <= 848) ? 15.0 : 25.0;
    double svgIconSize = (screenWidth * .5).clamp(15.0, upperLimit);

    final cardColor = isActive ? null : Colors.white;
    final gradient = isActive
        ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4C49ED), Color(0xFF0A06F4)],
          )
        : null;

    final textColor =
        isActive ? ColorsManager.white : ColorsManager.primaryTxtColor;
    final labelColor =
        isActive ? ColorsManager.white : ColorsManager.secondaryTxtColor;

    return GestureDetector(
      onTap: onTap,
      child: TitledContainer(
        title: title,
        columnAlignment: title == 'See All'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: cardColor,
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ColorsManager.borderSideColor,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyles.font11Regular(context).copyWith(
                            color: labelColor,
                          ),
                        ),
                        Text(
                          r'$5,756',
                          style: TextStyles.font18Medium(context).copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      height: svgIconSize,
                      width: svgIconSize,
                      AppImages.chipCardpng,
                      color: textColor,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyles.font11Regular(context).copyWith(
                            color: labelColor,
                          ),
                        ),
                        Text(
                          'Eddy Cusuma',
                          style: TextStyles.font18Medium(context).copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VALID THRU',
                          style: TextStyles.font11Regular(context).copyWith(
                            color: labelColor,
                          ),
                        ),
                        Text(
                          '12/12',
                          style: TextStyles.font18Medium(context).copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: ColorsManager.borderSideColor,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, left: 5, top: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3778 **** **** 1234',
                        style: TextStyles.font18Medium(context).copyWith(
                          color: textColor,
                        ),
                      ),
                      // SvgPicture.asset(
                      //   height: svgIconSize,
                      //   width: svgIconSize,
                      //   AppImages.masterCard,
                      //   colorFilter: isActive
                      //       ? const ColorFilter.mode(
                      //           ColorsManager.white,
                      //           BlendMode.srcIn,
                      //         )
                      //       : null,
                      //   fit: BoxFit.scaleDown,
                      // ),
                    ],
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
