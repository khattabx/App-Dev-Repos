import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:flutter/material.dart';

class MobileLayoutCard extends StatefulWidget {
  const MobileLayoutCard({super.key});

  @override
  State<MobileLayoutCard> createState() => _MobileLayoutCardState();
}

class _MobileLayoutCardState extends State<MobileLayoutCard> {
  bool isFirstCardActive = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final upperLimit = (screenWidth >= 811 && screenWidth <= 848) ? 15.0 : 25.0;
    double svgIconSize = (screenWidth * .5).clamp(15.0, upperLimit);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Cards",
                style: TextStyles.font18SemiBold(context).copyWith(
                  color: ColorsManager.primaryTxtColor,
                ),
              ),
              Text(
                "See All",
                style: TextStyles.font18SemiBold(context).copyWith(
                  color: ColorsManager.primaryTxtColor,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCard(
                context,
                svgIconSize,
                isActive: isFirstCardActive,
                onTap: () {
                  setState(() {
                    isFirstCardActive = true;
                  });
                },
                title: '',
              ),
              _buildCard(
                context,
                svgIconSize,
                isActive: !isFirstCardActive,
                onTap: () {
                  setState(() {
                    isFirstCardActive = false;
                  });
                },
                title: '',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(
    BuildContext context,
    double svgIconSize, {
    required bool isActive,
    required VoidCallback onTap,
    required String title,
  }) {
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

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: TitledContainer(
          title: title,
          columnAlignment:
              title == '' ? CrossAxisAlignment.start : CrossAxisAlignment.start,
          child: Container(
            width: 300,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17),
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
                        AppImages.chipCardpng,
                        height: svgIconSize,
                        width: svgIconSize,
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3778 **** **** 1234',
                        style: TextStyles.font18Medium(context).copyWith(
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
