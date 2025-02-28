import 'package:flutter/material.dart';
import 'widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  OnBoardingBody(),
    );
  }
}