import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/Auth/presentaion/pages/complete_information/widgets/complete_information_item.dart';

class CompleteInformationBody extends StatelessWidget {
  const CompleteInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace(10),
            CompleteInfoItem(
              maxLines: 1,
              text: 'Enter Your Name',
            ),
            VerticalSpace(2),
            CompleteInfoItem(
              maxLines: 1,
              text: 'Enter Your Phone Number',
            ),
            VerticalSpace(2),
            CompleteInfoItem(
              maxLines: 5,
              text: 'Enter Your Address',
            ),
            VerticalSpace(5),
            CustomGeneralButtons(text: 'Login')
          ],
        ),
      ),
    );
  }
}
