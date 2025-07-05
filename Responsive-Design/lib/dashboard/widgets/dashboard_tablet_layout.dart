import 'package:flutter/material.dart';

import 'package:dashboard/dashboard/widgets/custom_drawer.dart';
import 'package:dashboard/dashboard/widgets/dashboard_mobile_layout.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(width: 24),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: DashboardMobileLayout(),
          ),
        ),
        SizedBox(width: 24),
      ],
    );
  }
}
