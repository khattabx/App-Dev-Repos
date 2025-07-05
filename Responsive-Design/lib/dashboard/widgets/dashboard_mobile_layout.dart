
import 'package:dashboard/dashboard/widgets/all_expensess_and_quick_invoice_section.dart';
import 'package:dashboard/dashboard/widgets/income_section.dart';
import 'package:dashboard/dashboard/widgets/my_cards_and_transction_history_section.dart';
import 'package:flutter/material.dart';

class DashboardMobileLayout extends StatelessWidget {
  const DashboardMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AllExpensessAndQuickInvoiceSection(),
          SizedBox(height: 24),
          MyCardsAndTransctionHistorySection(),
          SizedBox(height: 24),
          IncomeSection(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
