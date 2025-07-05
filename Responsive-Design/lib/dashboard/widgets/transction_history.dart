import 'package:dashboard/dashboard/utils/app_styles.dart';
import 'package:dashboard/dashboard/widgets/transction_history_header.dart';
import 'package:dashboard/dashboard/widgets/transction_history_list_view.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TransactionHistoryHeader(),
        const SizedBox(height: 20),
        Text(
          '25 March 2025',
          style: AppStyles.styleMedium16(context).copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
        const SizedBox(height: 16),
        const TransctionHistoryListView()
      ],
    );
  }
}
