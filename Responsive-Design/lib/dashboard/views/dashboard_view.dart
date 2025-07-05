import 'package:flutter/material.dart';

import 'package:dashboard/dashboard/utils/size_config.dart';
import 'package:dashboard/dashboard/widgets/adaptive_layout_widgets.dart';
import 'package:dashboard/dashboard/widgets/custom_drawer.dart';
import 'package:dashboard/dashboard/widgets/dashboard_desktop_layout.dart';
import 'package:dashboard/dashboard/widgets/dashboard_mobile_layout.dart';
import 'package:dashboard/dashboard/widgets/dashboard_tablet_layout.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
 
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: MediaQuery.of(context).size.width < SizeConfig.tablet
          ? AppBar(
              backgroundColor: const Color(0xFFFAFAFA),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF4EB7F2),
                ),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            )
          : null,
      drawer:
          MediaQuery.of(context).size.width < SizeConfig.tablet ? const CustomDrawer() : null,
      backgroundColor: const Color(0xFFF7F9FA),
      body: AdaptiveLayout(
        mobileLayout: (context) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: DashboardMobileLayout(),
        ),
        tabletLayout: (context) => const DashboardTabletLayout(),
        desktopLayout: (context) => const DashboardDesktopLayout(),
      ),
    );
  }
}
