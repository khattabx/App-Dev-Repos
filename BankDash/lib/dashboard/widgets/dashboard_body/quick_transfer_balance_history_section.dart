import 'package:bankdash/dashboard/widgets/dashboard_body/balance_history.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/quick_transfer.dart';
import 'package:flutter/material.dart';

class QuickTransferBalanceHistorySection extends StatelessWidget {
  const QuickTransferBalanceHistorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        QuickTransfer(),
        SizedBox(width: 20),
        BalanceHistory(),
      ],
    );
  }
}
