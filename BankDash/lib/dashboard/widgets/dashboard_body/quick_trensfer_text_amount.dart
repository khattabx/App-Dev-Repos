import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/app_message.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickTrensferTextAmount extends StatelessWidget {
  const QuickTrensferTextAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = (screenWidth * 0.08).clamp(30.0, 40.0);
    double svgIconSize = (screenWidth * 0.5).clamp(10.0, 24.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Write Amount',
            style: TextStyles.font16Regular(context).copyWith(
              color: ColorsManager.secondaryTxtColor,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                color: ColorsManager.bgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: quickTrensferTextFieldAmount(context),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => CustomToast.showMessage(context),
                      child: Container(
                        height: containerHeight,
                        decoration: BoxDecoration(
                          color: ColorsManager.mainBlue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Send',
                            //   style: TextStyles.font16Medium(context).copyWith(
                            //     color: ColorsManager.white,
                            //   ),
                            // ),
                            // const SizedBox(width: 10),
                            SvgPicture.asset(
                              AppImages.send,
                              height: svgIconSize,
                              width: svgIconSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField quickTrensferTextFieldAmount(BuildContext context) {
    return TextField(
      cursorColor: ColorsManager.mainBlue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 15,
          bottom: 10,
        ),
        border: InputBorder.none,
        hintText: '185.20',
        hintStyle: TextStyles.font16Regular(context).copyWith(
          color: ColorsManager.secondaryTxtColor,
        ),
      ),
    );
  }
}
