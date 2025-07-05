import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/weekly_activity_chart.dart';
import 'package:flutter/material.dart';

class WeeklyActivity extends StatelessWidget {
  const WeeklyActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: TitledContainer(
        title: 'Wiekly Activity',
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                dipositWithdrawBar(),
                const SizedBox(height: 10),
                const WeeklyActivityChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dipositWithdrawBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: ColorsManager.teal,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(width: 10),
        const Text('Diposit'),
        const SizedBox(width: 30),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: ColorsManager.pink,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(width: 10),
        const Text('Withdraw'),
      ],
    );
  }
}
