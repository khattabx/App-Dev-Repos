import 'package:dashboard/dashboard/models/user_info_model.dart';
import 'package:dashboard/dashboard/utils/app_images.dart';
import 'package:dashboard/dashboard/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class LatestTransctionListView extends StatelessWidget {
  const LatestTransctionListView({super.key});
  static const items = [
    UserInfoModel(
      subtitle: 'mark.mccoy@gmailcom',
      title: 'Mark Mccoy',
      image: Assets.imagesAvatar1,
    ),
    UserInfoModel(
      subtitle: 'john.doe@gmailcom',
      title: 'John Doe',
      image: Assets.imagesAvatar2,
    ),
    UserInfoModel(
      subtitle: 'emma.smith@gmailcom',
      title: 'Emma Smith',
      image: Assets.imagesAvatar3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items
            .map(
              (e) => IntrinsicWidth(
                child: UserInfoListTile(userInfiModel: e),
              ),
            )
            .toList(),
      ),
    );

    // return SizedBox(
    //   height: 85,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       return IntrinsicWidth(
    //         child: UserInfoListTile(
    //           userInfiModel: items[index],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
