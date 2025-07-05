import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyActivityChart extends StatelessWidget {
  const WeeklyActivityChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 500,
          minY: 0,
          baselineY: 0,
          groupsSpace: 35,
          gridData: _getGridData(),
          titlesData: _getTitlesData(context),
          borderData: _getBorderData(),
          barGroups: _getBarGroups(),
        ),
      ),
    );
  }

  FlGridData _getGridData() {
    return FlGridData(
      show: true,
      drawHorizontalLine: true,
      horizontalInterval: 50,
      checkToShowHorizontalLine: (value) {
        return value >= 0 && value <= 1000.0;
      },
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          // ignore: deprecated_member_use
          color: Colors.grey.withOpacity(0.2),
          strokeWidth: 1,
        );
      },
    );
  }

  FlTitlesData _getTitlesData(BuildContext context) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => _bottomTitlesWidget(context, value),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 100,
          getTitlesWidget: (value, meta) => _leftTitlesWidget(context, value),
        ),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  Widget _bottomTitlesWidget(BuildContext context, double value) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sat';
        break;
      case 1:
        text = 'Sun';
        break;
      case 2:
        text = 'Mon';
        break;
      case 3:
        text = 'Tue';
        break;
      case 4:
        text = 'Wed';
        break;
      case 5:
        text = 'Thu';
        break;
      case 6:
        text = 'Fri';
        break;
      default:
        text = '';
        break;
    }
    return Text(
      text,
      style: TextStyles.font13Regular(context).copyWith(
        color: ColorsManager.primaryTxtColor,
      ),
    );
  }

  Widget _leftTitlesWidget(BuildContext context, double value) {
    if (value % 100 != 0) return const SizedBox.shrink();
    return Text(
      value.toInt().toString(),
      style: TextStyles.font13Regular(context).copyWith(
        color: ColorsManager.primaryTxtColor,
      ),
    );
  }

  FlBorderData _getBorderData() {
    return FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(
          // ignore: deprecated_member_use
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      _createBarGroup(0, 450, 220),
      _createBarGroup(1, 320, 120),
      _createBarGroup(2, 300, 250),
      _createBarGroup(3, 450, 350),
      _createBarGroup(4, 100, 220),
      _createBarGroup(5, 380, 220),
      _createBarGroup(6, 380, 320),
    ];
  }

  BarChartGroupData _createBarGroup(int x, double tealValue, double pinkValue) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: tealValue,
          color: ColorsManager.teal,
          width: 10,
          borderRadius: BorderRadius.circular(10),
        ),
        BarChartRodData(
          toY: pinkValue,
          color: ColorsManager.pink,
          width: 10,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }
}
