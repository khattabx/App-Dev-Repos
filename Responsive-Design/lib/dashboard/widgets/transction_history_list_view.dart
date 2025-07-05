import 'package:dashboard/dashboard/models/transction_model.dart';
import 'package:dashboard/dashboard/widgets/transction_item.dart';
import 'package:flutter/material.dart';

class TransctionHistoryListView extends StatelessWidget {
  const TransctionHistoryListView({super.key});
  static const items = [
    TransctionModel(
      title: 'Cash Withdrawal',
      date: '25 Mar, 2025',
      amount: r'$2,129',
      isWithdrawal: true,
    ),
    TransctionModel(
      title: 'Landing Page Design',
      date: '25 Mar, 2025',
      amount: r'$2000',
      isWithdrawal: false,
    ),
    TransctionModel(
      title: 'Juni Mobile App project',
      date: '25 Mar, 2025',
      amount: r'$3000',
      isWithdrawal: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) => TransctionItem(transctionModel: e)).toList(),
    );


    //! List View make an error with shrink wrap and custom scroll view
    // return ListView.builder(
    //   itemCount: items.length,
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     return TransctionItem(transctionModel: items[index]);
    //   },
    // );
  }
}
