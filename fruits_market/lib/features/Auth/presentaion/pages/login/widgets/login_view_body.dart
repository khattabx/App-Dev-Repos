import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '/core/constants/consttants.dart';
import '/core/utlis/size_config.dart';
import '/core/widgets/custom_buttons.dart';
import '/core/widgets/space_widget.dart';
import '/features/Auth/presentaion/pages/complete_information/complete_information_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(10),
        SizedBox(
          height: SizeConfig.defaultSize! * 17,
          child: Image.asset(kLogo),
        ),
        const Text(
          'Fruit Market',
          style: TextStyle(
            fontSize: 51,
            color: kMainColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Expanded(child: SizedBox()),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButtonWithIcons(
                    onTap: () {
                      Get.to(() => const CompleteInformationView(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.rightToLeft);
                    },
                    color: const Color(0xFF666666),
                    iconData: FontAwesomeIcons.google,
                    text: 'Log in with'),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButtonWithIcons(
                    onTap: () {
                      Get.to(() => const CompleteInformationView(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.rightToLeft);
                    },
                    color: const Color(0xFF4267B2),
                    iconData: FontAwesomeIcons.facebookF,
                    text: 'Log in with'),
              ),
            ),
          ],
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }
}
