import 'package:bankdash/dashboard/models/drawer_item_model.dart';
import 'package:bankdash/dashboard/widgets/drawer/active_inactive_drawer_item.dart';
import 'package:flutter/material.dart';

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
      duration: const Duration(milliseconds: 300),
      child: isActive
          ? ActiveDrawerItem(
              drawerItemModel: drawerItemModel,
              key: const ValueKey('active'),
            )
          : InActiveDrawerItem(
              drawerItemModel: drawerItemModel,
              key: const ValueKey('inactive'),
            ),
    );
  }
}
