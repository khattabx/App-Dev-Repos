import 'package:flutter/material.dart';
import 'package:bookly/Core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.rating,
    required this.ratingCount,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFFFDD4F),
          size: 14.0,
        ),
        const SizedBox(width: 6.0),
        Text(
          rating.toString(),
          style: Styles.textStyle16.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 6.0),
        Text(
          '($ratingCount)',
          style: Styles.textStyle14.copyWith(color: const Color(0xFFA0A0A0)),
        )
      ],
    );
  }
}
