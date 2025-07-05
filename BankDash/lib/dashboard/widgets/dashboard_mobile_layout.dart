import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/app_message.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:bankdash/dashboard/widgets/app_bar/custom_searsh_bar.dart';
import 'package:bankdash/dashboard/widgets/app_bar/rounded_image_container.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/balance_history.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/expense_statistics.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/mobile_layout_card.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/quick_transfer.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/recent_transaction.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/weekly_activity.dart';
import 'package:flutter/material.dart';

class DashboardMobileLayout extends StatelessWidget {
  const DashboardMobileLayout({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: CustomSearshBar(color: ColorsManager.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: SizedBox(
                width: double.infinity,
                child: MobileLayoutCard(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [RecentTransaction()],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [WeeklyActivity()],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [ExpenseStatistics()],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [QuickTransfer()],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [BalanceHistory()],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: onTap ?? () {},
        child: const Icon(
          Icons.menu_rounded,
          size: 30,
          color: ColorsManager.primaryTxtColor,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Overview',
        style: TextStyles.font28SemiBold(context).copyWith(
          color: ColorsManager.primaryTxtColor,
        ),
      ),
      actions: [
        RoundedImageContainer(
          onTap: () => CustomToast.showMessage(context),
          image: AppImages.user1,
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
