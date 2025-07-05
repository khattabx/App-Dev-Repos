// ignore_for_file: deprecated_member_use

import 'package:bankdash/dashboard/models/recent_transaction_model.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentTransactionItem extends StatelessWidget {
  const RecentTransactionItem({
    super.key,
    required this.recentTransactionModel,
  });

  final RecentTransactionModel recentTransactionModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double svgIconSize = (screenWidth * .5).clamp(30.0, 45.0);
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Center(
        child: ListTile(
          
          leading: Container(
            width: svgIconSize,
            height: svgIconSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: recentTransactionModel.backgroundColor.withOpacity(0.3),
            ),
            child:
                Center(child: SvgPicture.asset(recentTransactionModel.image)),
          ),
          title: Text(
            overflow: TextOverflow.fade,
            recentTransactionModel.title,
            style: TextStyles.font13SemiBold(context)
                .copyWith(color: ColorsManager.primaryTxtColor),
          ),
          subtitle: Text(
            recentTransactionModel.date,
            style: TextStyles.font11Regular(context)
                .copyWith(color: ColorsManager.secondaryTxtColor),
          ),
          trailing: Text(
            recentTransactionModel.amount,
            style: TextStyles.font11SemiBold(context).copyWith(
              color: recentTransactionModel.isWithdrawal
                  ? ColorsManager.pink
                  : ColorsManager.teal,
            ),
          ),
        ),
      ),
    );
  }
}
