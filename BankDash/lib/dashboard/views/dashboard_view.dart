import 'package:bankdash/dashboard/widgets/adaptive_layout_widget.dart';
import 'package:bankdash/dashboard/widgets/dashboard_desktop_layout.dart';
import 'package:bankdash/dashboard/widgets/dashboard_mobile_layout.dart';
import 'package:bankdash/dashboard/widgets/dashboard_tablet_layout.dart';
import 'package:bankdash/dashboard/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth >= 810;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        child: SizedBox(
          width: isMobile ? screenWidth * 0.3 : screenWidth * 0.5,
          child: const CustomDrawer(),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AdaptiveLayout(
            mobileLayout: (context) => DashboardMobileLayout(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            tabletLayout: (context) => DashboardTabletLayout(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            desktopLayout: (context) => const DashboardDesktopLayout(),
          ),
        ),
      ),
    );
  }
}
