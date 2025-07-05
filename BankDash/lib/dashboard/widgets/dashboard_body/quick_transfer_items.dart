import 'package:bankdash/dashboard/models/quick_transfer_model.dart';
import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/utils/styles.dart';
import 'package:flutter/material.dart';

class QuickTransferItems extends StatelessWidget {
  const QuickTransferItems({
    super.key,
    required this.quickTransferModel,
  });

  final QuickTransferModel quickTransferModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = (screenWidth * 0.05).clamp(50.0, 70.0);

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            height: imageSize,
            width: imageSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  quickTransferModel.image,
                ),
                fit: BoxFit.cover,
              ),
              color: ColorsManager.bgColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            quickTransferModel.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16Regular(context).copyWith(
              color: ColorsManager.primaryTxtColor,
            ),
          ),
          Text(
            quickTransferModel.jobTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font15Regular(context).copyWith(
              color: ColorsManager.secondaryTxtColor,
            ),
          ),
        ],
      ),
    );
  }
}
