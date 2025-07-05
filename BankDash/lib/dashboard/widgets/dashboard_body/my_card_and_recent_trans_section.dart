
import 'package:bankdash/dashboard/widgets/dashboard_body/recent_transaction.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/seclected_card_section.dart';
import 'package:flutter/material.dart';

class MyCardAndRecentTransSection extends StatelessWidget {
  const MyCardAndRecentTransSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SelectedCardSection(),
        SizedBox(width: 20),
        RecentTransaction()
      ],
    );
  }
}
