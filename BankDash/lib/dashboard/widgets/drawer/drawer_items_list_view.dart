import 'package:bankdash/dashboard/models/drawer_item_model.dart';
import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/widgets/drawer/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItemsListView extends StatefulWidget {
  const DrawerItemsListView({super.key});

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
  int activeIndex = 0;

  final List<DrawerItemModel> items = [
    const DrawerItemModel(title: 'Dashboard', image: AppImages.home),
    const DrawerItemModel(title: 'Transactions', image: AppImages.transfer),
    const DrawerItemModel(title: 'Accounts', image: AppImages.user),
    const DrawerItemModel(title: 'Investments', image: AppImages.investment),
    const DrawerItemModel(title: 'Credit Cards', image: AppImages.creditCard),
    const DrawerItemModel(title: 'Loans', image: AppImages.loan),
    const DrawerItemModel(title: 'My Privileges', image: AppImages.service),
    const DrawerItemModel(title: 'Setting', image: AppImages.settingsSolid),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
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
              padding: const EdgeInsets.only(top: 5),
              child: DrawerItem(
                drawerItemModel: items[index],
                isActive: activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
