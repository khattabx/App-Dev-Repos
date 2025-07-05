import 'package:bankdash/dashboard/models/quick_transfer_model.dart';
import 'package:bankdash/dashboard/utils/app_images.dart';
import 'package:bankdash/dashboard/widgets/dashboard_body/quick_transfer_items.dart';
import 'package:flutter/material.dart';

class QuickTransferItemsListView extends StatelessWidget {
  const QuickTransferItemsListView({super.key});

  static List items = [
    QuickTransferModel(
      image: AppImages.user2,
      name: 'Livia Bator',
      jobTitle: 'CEO',
    ),
    QuickTransferModel(
      image: AppImages.user3,
      name: 'Randy Press',
      jobTitle: 'Director',
    ),
    QuickTransferModel(
      image: AppImages.user4,
      name: 'Workman',
      jobTitle: 'Designer',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items
              .map((e) => QuickTransferItems(
                    quickTransferModel: e,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
