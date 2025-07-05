import 'package:dashboard/dashboard/utils/app_styles.dart';
import 'package:dashboard/dashboard/widgets/latest_transction_lis_view.dart';
import 'package:flutter/material.dart';

class LatestTransction extends StatelessWidget {
  const LatestTransction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Transaction',
          style: AppStyles.styleMedium16(context),
        ),
        const SizedBox(height: 16),
        const LatestTransctionListView(),
      ],
    );
  }
}
