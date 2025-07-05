import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';

class TitledContainer extends StatelessWidget {
  const TitledContainer({
    super.key,
    required this.title,
    required this.child,
    this.columnAlignment,
    this.secondrytTitle,
  });
  final String title;
  final String? secondrytTitle;
  final Widget child;
  final CrossAxisAlignment? columnAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: columnAlignment ?? CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.font18SemiBold(context).copyWith(
                color: ColorsManager.primaryTxtColor,
              ),
            ),
            Text(
              secondrytTitle ?? '',
              style: TextStyles.font18SemiBold(context).copyWith(
                color: ColorsManager.primaryTxtColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          child: child,
        ),
      ],
    );
  }
}
