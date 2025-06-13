import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../controllers/dialog_contact.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      6,
      (index) => AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
      ),
    );
    _animations = _controllers
        .map((controller) => Tween(begin: 0.0, end: 1.0).animate(controller))
        .toList();

    Future.delayed(Duration(milliseconds: 100), () {
      for (var controller in _controllers) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 22,
                  child: ClipRRect(
                    child: Center(
                      child: SvgPicture.asset(
                        width: 30,
                        height: 30,
                        'assets/icons/headphones.svg',
                        colorFilter:
                            const ColorFilter.mode(secColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Profile',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'bold'),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                _buildAnimatedRow(0, 'Developer', Icons.person_outline, () {
                  DialogHelper.showLinkDialog(
                    url: 'https://linktr.ee/userahmed',
                    title: 'Click the button to contact the developer.',
                  );
                }),
                const SizedBox(height: 20),
                _buildAnimatedRow(1, 'Report', Icons.bug_report_outlined, () {
                  Get.snackbar(
                    "Reporting",
                    "If you have any issue, please report it to the Developer",
                    colorText: Colors.white,
                    icon: const Icon(Icons.report_gmailerrorred_rounded,
                        color: Colors.red),
                    isDismissible: true,
                    animationDuration: const Duration(milliseconds: 400),
                  );
                }),
                const SizedBox(height: 20),
                _buildAnimatedRow(2, 'Stats', Icons.bar_chart_rounded, () {
                  Get.snackbar(
                    "In Progress",
                    "This feature is currently being developed. Stay tuned for updates!",
                    colorText: Colors.white,
                    icon: const Icon(Icons.code_rounded, color: Colors.green),
                    isDismissible: true,
                    animationDuration: const Duration(milliseconds: 400),
                  );
                }),
                const SizedBox(height: 20),
                _buildAnimatedRow(3, 'Favorites', Icons.favorite_border, () {
                  Get.snackbar(
                    "In Progress",
                    "This feature is currently being developed. Stay tuned for updates!",
                    colorText: Colors.white,
                    icon: const Icon(Icons.code_rounded, color: Colors.green),
                    isDismissible: true,
                    animationDuration: const Duration(milliseconds: 400),
                  );
                }),
                const SizedBox(height: 20),
                _buildAnimatedRow(4, 'Log Out', Icons.lightbulb_outline, () {
                  Get.snackbar(
                    "In Progress",
                    "This feature is currently being developed. Stay tuned!",
                    colorText: Colors.white,
                    icon: const Icon(Icons.code_rounded, color: Colors.green),
                    isDismissible: true,
                    animationDuration: const Duration(milliseconds: 400),
                  );
                }),
                const SizedBox(height: 20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.copyright_rounded,
                  color: whiteColor.withOpacity(0.5),
                  size: 10,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'All rights reserved. By Ahmed Yasser',
                  style: ourStyle(
                    color: whiteColor.withOpacity(0.5),
                    family: 'bold',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedRow(
      int index, String text, IconData icon, VoidCallback onTap) {
    return FadeTransition(
      opacity: _animations[index],
      child: NewRow(
        text: text,
        icon: icon,
        onTap: onTap,
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final VoidCallback onTap;

  const NewRow({
    this.icon,
    this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: whiteColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text!,
              style: ourStyle(
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
