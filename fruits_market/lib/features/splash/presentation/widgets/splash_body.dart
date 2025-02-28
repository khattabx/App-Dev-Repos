// ignore_for_file: avoid_unnecessary_containers, unused_element

import 'package:flutter/material.dart';
import 'package:fruits_market/core/utlis/size_config.dart';
import 'package:fruits_market/features/onBoarding/presentation/on_boarding_view.dart';
import 'package:get/get.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fadingAinmation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    fadingAinmation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);

    goToNextView() {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(() => const OnBoardingView(), transition: Transition.fade);
      });
    }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          const Spacer(),
          AnimatedBuilder(
            animation: fadingAinmation!,
            builder: (context, _) => Opacity(
              opacity: fadingAinmation?.value,
              child: const Text(
                "Fruit Market",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 51,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          Image.asset('assets/images/splash_view_image.png'),
        ],
      ),
    );
  }
}
