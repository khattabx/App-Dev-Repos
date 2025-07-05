import 'package:dashboard/dashboard/widgets/all_expeensess.dart';
import 'package:dashboard/dashboard/widgets/quick_invoice.dart';
import 'package:flutter/material.dart';

class AllExpensessAndQuickInvoiceSection extends StatelessWidget {
  const AllExpensessAndQuickInvoiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AllExpeensess(),
        SizedBox(height: 24),
        QuickInvoive(),
      ],
    );
  }
}
