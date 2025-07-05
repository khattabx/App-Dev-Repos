import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseStatisticsChart extends StatefulWidget {
  const ExpenseStatisticsChart({
    super.key,
  });

  @override
  State<ExpenseStatisticsChart> createState() => _ExpenseStatisticsChartState();
}

class _ExpenseStatisticsChartState extends State<ExpenseStatisticsChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            sectionsSpace: 2,
            centerSpaceRadius: 0,
            centerSpaceColor: Colors.transparent,
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse?.touchedSection == null) {
                    touchedIndex = null;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse!.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            sections: [
              PieChartSectionData(
                color: ColorsManager.darkOrange,
                value: 15,
                title: touchedIndex == 0 ? 'Bill Expense' : '15%',
                radius: touchedIndex == 0 ? 115 : 100,
                titlePositionPercentageOffset: touchedIndex == 0 ? 1.39 : 0.6,
                titleStyle: TextStyles.font16Bold(context).copyWith(
                  color: touchedIndex == 0
                      ? ColorsManager.darkOrange
                      : ColorsManager.white,
                ),
              ),
              PieChartSectionData(
                color: ColorsManager.mainBlue,
                value: 25,
                title: touchedIndex == 1 ? 'Others' : '20%',
                radius: touchedIndex == 1 ? 95 : 80,
                titlePositionPercentageOffset: touchedIndex == 1 ? 1.1 : 0.6,
                titleStyle: TextStyles.font16Bold(context).copyWith(
                  color: touchedIndex == 1
                      ? ColorsManager.mainBlue
                      : ColorsManager.white,
                ),
              ),
              PieChartSectionData(
                color: ColorsManager.pink,
                value: 40,
                title: touchedIndex == 2 ? 'Investment' : '35%',
                radius: touchedIndex == 2 ? 85 : 70,
                titlePositionPercentageOffset: touchedIndex == 2 ? 1.6 : 0.6,
                titleStyle: TextStyles.font16Bold(context).copyWith(
                  color: touchedIndex == 2
                      ? ColorsManager.pink
                      : ColorsManager.white,
                ),
              ),
              PieChartSectionData(
                color: ColorsManager.primaryTxtColor,
                value: 30,
                title: touchedIndex == 3 ? 'Entertainment' : '30%',
                radius: touchedIndex == 3 ? 100 : 85,
                titlePositionPercentageOffset: touchedIndex == 3 ? 1.35 : 0.6,
                titleStyle: TextStyles.font16Bold(context).copyWith(
                  color: touchedIndex == 3
                      ? ColorsManager.primaryTxtColor
                      : ColorsManager.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
