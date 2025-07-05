import 'package:bankdash/dashboard/widgets/dashboard_body/expense_statistics_chart.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:flutter/material.dart';

class ExpenseStatistics extends StatelessWidget {
  const ExpenseStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TitledContainer(
        title: 'Expense Statistics',
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExpenseStatisticsChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
