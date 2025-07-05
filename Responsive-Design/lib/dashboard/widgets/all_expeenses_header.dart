import 'package:dashboard/dashboard/utils/app_styles.dart';
import 'package:dashboard/dashboard/widgets/range_options.dart';
import 'package:flutter/material.dart';

class AllExpeensesHeader extends StatelessWidget {
  const AllExpeensesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'All Expeenses',
          style: AppStyles.styleSemiBold20(context),
        ),
        const Expanded(child: SizedBox()),
        const RangeOptions(),
      ],
    );
  }
}
