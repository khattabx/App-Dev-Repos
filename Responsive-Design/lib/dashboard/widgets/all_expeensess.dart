import 'package:dashboard/dashboard/widgets/coustom_background_container.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/dashboard/widgets/all_expeenses_header.dart';
import 'package:dashboard/dashboard/widgets/all_expensess_item_list_view.dart';

class AllExpeensess extends StatelessWidget {
  const AllExpeensess({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoustomBackgroundContainer(
      child: Column(
        children: [
          AllExpeensesHeader(),
          SizedBox(height: 16),
          AllExpensessItemListView(),
        ],
      ),
    );
  }
}
