// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/Core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';

import '../../../../../Core/widgets/custom_button.dart';
import '../../../../../constants.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              bgColor: Colors.white,
              txtColor: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUr(context, bookModel.volumeInfo.previewLink!);
              },
              text: getText(bookModel),
              fontSize: 14,
              bgColor: const Color(0xFFEF8262),
              txtColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
