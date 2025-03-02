import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String title;
  const PageHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSerif'
        ),
      ),
    );
  }
}
