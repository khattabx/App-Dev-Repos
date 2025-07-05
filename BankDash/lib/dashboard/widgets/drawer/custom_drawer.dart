import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/widgets/drawer/drawer_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth >= 810;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: ColorsManager.borderSideColor, width: 1.5),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35.0, top: isMobile ? 30.0 : 50.0),
            child: SvgPicture.asset(AppImages.logo),
          ),
          const SizedBox(height: 10),
          const DrawerItemsListView()
        ],
      ),
    );
  }
}
