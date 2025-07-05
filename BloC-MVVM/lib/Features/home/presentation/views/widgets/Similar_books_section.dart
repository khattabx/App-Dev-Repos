
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'similar_book_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'You might also like',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        const SimilarBookListview(),
      ],
    );
  }
}
