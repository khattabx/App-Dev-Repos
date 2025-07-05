import 'package:bankdash/dashboard/widgets/dashboard_body/dashboard_body.dart';
import 'package:bankdash/dashboard/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomDrawer(),
        ),
        Expanded(
          flex: 4,
          child: DashboardBody(),
        ),
      ],
    );
  }
}
