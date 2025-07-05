import 'package:bankdash/dashboard/widgets/dashboard_body/blance_history_chart.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:flutter/material.dart';

class BalanceHistory extends StatelessWidget {
  const BalanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: TitledContainer(
        title: 'Balance History',
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, bottom: 20.0, top: 30.0),
            child: BalanceHistoryChart(),
          ),
        ),
      ),
    );
  }
}
