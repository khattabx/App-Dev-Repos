import 'package:dashboard/dashboard/models/drawer_item_model.dart';
import 'package:dashboard/dashboard/utils/app_images.dart';
import 'package:dashboard/dashboard/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItemlistView extends StatefulWidget {
  const DrawerItemlistView({
    super.key,
  });

  @override
  State<DrawerItemlistView> createState() => _DrawerItemlistViewState();
}

class _DrawerItemlistViewState extends State<DrawerItemlistView> {
  int activeIndex = 0;

  final List<DrawerItemModel> items = [
    DrawerItemModel(
      title: 'Dashboard',
      image: Assets.imagesDashboard,
    ),
    DrawerItemModel(
      title: 'My Transactions',
      image: Assets.imagesMyTransctions,
    ),
    DrawerItemModel(
      title: 'Statistics',
      image: Assets.imagesStatistics,
    ),
    DrawerItemModel(
      title: 'Wallet Account',
      image: Assets.imagesWalletAccount,
    ),
    DrawerItemModel(
      title: 'My Investments',
      image: Assets.imagesMyInvestments,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: DrawerItem(
              drawerItemModel: items[index],
              isActive: activeIndex == index,
            ),
          ),
        );
      },
    );
  }
}
