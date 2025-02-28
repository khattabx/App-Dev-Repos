import 'package:flutter/material.dart';
import '/core/constants/consttants.dart';
import './widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:kMainColor,
      body: SplashBody(),
    );
  }
}
