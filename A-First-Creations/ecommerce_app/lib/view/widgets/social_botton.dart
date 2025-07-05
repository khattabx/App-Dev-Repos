// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SocialBotton extends StatelessWidget {
  const SocialBotton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });
  final String image;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(width: 90),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
