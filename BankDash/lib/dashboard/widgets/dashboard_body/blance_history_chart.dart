// ignore_for_file: deprecated_member_use

import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BalanceHistoryChart extends StatelessWidget {
  const BalanceHistoryChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LineChart(
        LineChartData(
          lineTouchData: _buildLineTouchData(context),
          titlesData: _buildTitlesData(context),
          gridData: _buildGridData(),
          lineBarsData: [_buildLineChartBarData()],
          borderData: _buildBorderData(),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 800,
        ),
      ),
    );
  }

  LineTouchData _buildLineTouchData(BuildContext context) {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        getTooltipItems: (touchedSpots) {
          return touchedSpots
              .map(
                (spot) => LineTooltipItem(
                  spot.y.toInt().toString(),
                  TextStyles.font13Regular(context).copyWith(
                    color: ColorsManager.white,
                  ),
                ),
              )
              .toList();
        },
      ),
    );
  }

  FlTitlesData _buildTitlesData(BuildContext context) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          interval: 1,
          getTitlesWidget: (value, meta) => _bottomTitle(value, context),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 200,
          getTitlesWidget: (value, meta) => Text(
            value.toInt().toString(),
            style: TextStyles.font13Regular(context).copyWith(
              color: ColorsManager.primaryTxtColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 200,
      getDrawingHorizontalLine: (_) => _dashedGridLine(),
      getDrawingVerticalLine: (_) => _dashedGridLine(),
    );
  }

  FlLine _dashedGridLine() {
    return FlLine(
      color: ColorsManager.secondaryTxtColor.withOpacity(0.2),
      strokeWidth: 1,
      dashArray: [5, 5],
    );
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      isCurved: true,
      color: ColorsManager.mainBlue,
      barWidth: 3,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            ColorsManager.mainBlue.withOpacity(0.4),
            Colors.white.withOpacity(0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      spots: const [
        FlSpot(0, 50),
        FlSpot(1, 470),
        FlSpot(2, 110),
        FlSpot(3, 560),
        FlSpot(4, 310),
        FlSpot(5, 790),
        FlSpot(6, 150),
      ],
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 0,
            color: ColorsManager.mainBlue,
          );
        },
      ),
    );
  }

  FlBorderData _buildBorderData() {
    return FlBorderData(
      show: true,
      border: Border(
        top: _solidBorder(),
        bottom: _solidBorder(),
        left: _solidBorder(),
        right: _solidBorder(),
      ),
    );
  }

  BorderSide _solidBorder() {
    return BorderSide(
      color: ColorsManager.secondaryTxtColor.withOpacity(0.2),
      width: 0.4,
      style: BorderStyle.solid,
    );
  }

  Widget _bottomTitle(double value, BuildContext context) {
    final months = ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan'];
    if (value.toInt() >= 0 && value.toInt() < months.length) {
      return Text(
        months[value.toInt()],
        style: TextStyles.font13Regular(context).copyWith(
          color: ColorsManager.primaryTxtColor,
        ),
      );
    }
    return const SizedBox();
  }
}
