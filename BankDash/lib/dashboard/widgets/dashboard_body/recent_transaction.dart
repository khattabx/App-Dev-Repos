import 'package:bankdash/dashboard/widgets/dashboard_body/recent_transaction_model_list_view.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    /// This method is applied only on mobile layout,
    /// and reverts to the default value on all other platforms.
    /// Cuz 220 not enough for mobile layout but 240 is enough and fix the overflow issue.
    final containerHeight = screenWidth < 810 ? 240.0 : 220.0;
    return Expanded(
      child: TitledContainer(
        title: 'Recent Transaction',
        child: Container(
          height: containerHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: [
              RecentTransactionModelListView(),
            ],
          ),
        ),
      ),
    );
  }
}
