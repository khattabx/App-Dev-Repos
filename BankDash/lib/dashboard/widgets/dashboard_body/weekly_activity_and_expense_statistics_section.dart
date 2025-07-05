import 'package:bankdash/dashboard/widgets/dashboard_body/expense_statistics.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/weekly_activity.dart';
import 'package:flutter/material.dart';

class WeeklyActivityAndExpenseStatisticsSection extends StatelessWidget {
  const WeeklyActivityAndExpenseStatisticsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        WeeklyActivity(),
        SizedBox(width: 20),
        ExpenseStatistics(),
      ],
    );
  }
}
