import 'package:flutter/material.dart';
import 'package:money_tracker/screens/stats/widgets/chart.dart';

class ChartView extends StatelessWidget {
  const ChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: const MyChart(),
    );
  }
}
