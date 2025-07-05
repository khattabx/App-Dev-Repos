import 'package:dashboard/dashboard/utils/app_styles.dart';
import 'package:dashboard/dashboard/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.title,
    required this.hint,
  });

  final String title, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleMedium16(context),
        ),
        const SizedBox(height: 12),
        CustomTextFeild(
          hint: hint,
        )
      ],
    );
  }
}
