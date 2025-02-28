import 'package:flutter/material.dart';
import 'package:fruits_market/core/utlis/size_config.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(22),
        SizedBox(
            height: SizeConfig.defaultSize! * 20, child: Image.asset(image!)),
        const VerticalSpace(5),
        Text(
          title!,
          style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF2f2e41),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        const VerticalSpace(1.5),
        Text(
          subTitle!,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF78787c),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
