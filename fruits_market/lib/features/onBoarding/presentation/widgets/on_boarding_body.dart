import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/features/Auth/presentaion/pages/login/login_view.dart';
import '/features/onBoarding/presentation/widgets/custom_indicatorr.dart';
import '/features/onBoarding/presentation/widgets/custom_page_view.dart';
import '/core/utlis/size_config.dart';
import '/core/widgets/custom_buttons.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        CustomPageView(pageController: pageController),
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.defaultSize! * 27,
          child: CustomIndicatorr(
            dotIndex: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: 32,
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF898989),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 10,
          child: CustomGeneralButtons(
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Get.to(()=> const LoginView(),transition: Transition.rightToLeft,duration: const Duration(microseconds: 500));
              }
            },
            text: pageController!.hasClients
                ? (pageController?.page == 2 ? 'Get Started' : 'Next')
                : 'Next',
          ),
        ),
      ],
    );
  }
}
