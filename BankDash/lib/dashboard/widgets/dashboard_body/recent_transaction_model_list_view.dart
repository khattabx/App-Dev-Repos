import 'package:bankdash/dashboard/models/recent_transaction_model.dart';
import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/recent_transaction_item.dart';
import 'package:flutter/material.dart';

class RecentTransactionModelListView extends StatelessWidget {
  const RecentTransactionModelListView({super.key});
  static const items = [
    RecentTransactionModel(
      title: 'Deposit from my Card',
      date: '28 January 2021',
      amount: r'-$850',
      isWithdrawal: true,
      image: AppImages.wallet,
      backgroundColor: ColorsManager.orange,
    ),
    RecentTransactionModel(
      title: 'Deposit Paypal',
      date: '25 January 2021',
      amount: r'+$2,500',
      isWithdrawal: false,
      image: AppImages.paypal,
      backgroundColor: ColorsManager.mainBlue,
    ),
    RecentTransactionModel(
      title: 'Jemi Wilson',
      date: '21 January 2021',
      amount: r'+$5,400',
      isWithdrawal: false,
      image: AppImages.dollar,
      backgroundColor: ColorsManager.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map((e) => RecentTransactionItem(recentTransactionModel: e))
          .toList(),
    );
  }
}
