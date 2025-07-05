
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';

class ExpenseStatisticsChartTitleListVew extends StatelessWidget {
  const ExpenseStatisticsChartTitleListVew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpenseStatisticsChartTitle(
          title: 'Investment',
          color: ColorsManager.pink,
        ),
        ExpenseStatisticsChartTitle(
          title: 'Entertainment',
          color: ColorsManager.primaryTxtColor,
        ),
        ExpenseStatisticsChartTitle(
          title: 'others',
          color: ColorsManager.mainBlue,
        ),
        ExpenseStatisticsChartTitle(
          title: 'Bill Expense',
          color: ColorsManager.darkOrange,
        ),
      ],
    );
  }
}

class ExpenseStatisticsChartTitle extends StatelessWidget {
  const ExpenseStatisticsChartTitle({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.font13Bold(context)
                .copyWith(color: ColorsManager.primaryTxtColor),
          ),
        ],
      ),
    );
  }
}
