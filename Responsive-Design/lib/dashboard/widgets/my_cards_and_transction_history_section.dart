import 'package:dashboard/dashboard/widgets/coustom_background_container.dart';
import 'package:dashboard/dashboard/widgets/my_cards_section.dart';
import 'package:dashboard/dashboard/widgets/transction_history.dart';
import 'package:flutter/material.dart';

class MyCardsAndTransctionHistorySection extends StatelessWidget {
  const MyCardsAndTransctionHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoustomBackgroundContainer(
      child: Column(
        children: [
          MyCardsSection(),
          Divider(
            height: 40,
            color: Color(0xffF1F1F1),
          ),
          TransactionHistory(),
        ],
      ),
    );
  }
}
