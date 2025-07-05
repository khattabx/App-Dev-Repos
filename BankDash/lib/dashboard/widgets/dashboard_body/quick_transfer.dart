import 'package:bankdash/dashboard/widgets/dashboard_body/quick_transfer_items_list_view.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/quick_trensfer_text_amount.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/titled_container.dart';
import 'package:flutter/material.dart';

class QuickTransfer extends StatelessWidget {
  const QuickTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TitledContainer(
        title: 'Quick Transfer',
        secondrytTitle: 'See All',
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuickTransferItemsListView(),
                QuickTrensferTextAmount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
