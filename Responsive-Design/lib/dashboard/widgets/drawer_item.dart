import 'package:flutter/material.dart';
import 'package:dashboard/dashboard/models/drawer_item_model.dart';
import 'package:dashboard/dashboard/widgets/active_inactive_drawer_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isActive,
  });

  final DrawerItemModel drawerItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (widget, animation) {
        return FadeTransition(
          opacity: animation,
          child: widget,
        );
      },
      child: isActive
          ? ActiveDrawerItem(
              key: const ValueKey('active'),
              drawerItemModel: drawerItemModel,
            )
          : InActiveDrawerItem(
              key: const ValueKey('inactive'),
              drawerItemModel: drawerItemModel,
            ),
    );
  }
}
