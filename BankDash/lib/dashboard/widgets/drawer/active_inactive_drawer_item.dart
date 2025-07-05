import 'package:bankdash/dashboard/models/drawer_item_model.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(width: 34),
          SvgPicture.asset(
            drawerItemModel.image,
            colorFilter: const ColorFilter.mode(
              ColorsManager.inactiveTxtColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            drawerItemModel.title,
            style: TextStyles.font16Medium(context).copyWith(
              color: ColorsManager.inactiveTxtColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            decoration: const BoxDecoration(
              color: ColorsManager.mainBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          const SizedBox(width: 30),
          SvgPicture.asset(
            drawerItemModel.image,
            colorFilter: const ColorFilter.mode(
              ColorsManager.mainBlue,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            drawerItemModel.title,
            style: TextStyles.font16Medium(context).copyWith(
              color: ColorsManager.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}
