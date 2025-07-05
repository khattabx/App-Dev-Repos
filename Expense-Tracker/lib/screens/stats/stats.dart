import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/stats/widgets/income_expenses_switch.dart';
import 'package:money_tracker/screens/stats/widgets/chart_details.dart';
import 'package:money_tracker/screens/stats/widgets/chart_view.dart';
import 'package:money_tracker/screens/stats/widgets/custom_stats_app_bar.dart';
import 'package:money_tracker/screens/stats/widgets/stats_bar.dart';
import 'package:money_tracker/screens/stats/widgets/stats_tranctions_item.dart';

class StatsScreen extends StatelessWidget {
  final List<Expense> expenses;
  const StatsScreen(
    this.expenses, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 20.0),
        child: Column(
          children: [
            const CustomStatsAppBar(),
            const SizedBox(height: 20.0),
            const IncomeExpensesSwitch(),
            const SizedBox(height: 20.0),
            const ChartDetails(),
            const ChartView(),
            const SizedBox(height: 20.0),
            const StatsBar(),
            const SizedBox(height: 20.0),
            StatsTranctionsItem(expenses: expenses)
          ],
        ),
      ),
    );
  }
}
