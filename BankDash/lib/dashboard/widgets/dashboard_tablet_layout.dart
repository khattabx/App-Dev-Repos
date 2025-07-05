import 'package:bankdash/dashboard/widgets/app_bar/custom_app_bar.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/balance_history.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/expense_statistics.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/my_card_and_recent_trans_section.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/quick_transfer.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/weekly_activity.dart';
import 'package:flutter/material.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            onTap: onTap ?? () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: Column(
              children: [
                MyCardAndRecentTransSection(),
                SizedBox(height: 20),
                Row(
                  children: [
                    WeeklyActivity(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    QuickTransfer(),
                    SizedBox(width: 20),
                    ExpenseStatistics(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    BalanceHistory(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
