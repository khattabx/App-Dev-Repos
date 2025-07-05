import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:money_tracker/screens/home/views/home_screen.dart';

class CustomStatsAppBar extends StatelessWidget {
  const CustomStatsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: IconButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         const HomeScreen(),
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left_circle_fill,
                    color: Color(0xFFA5B0C8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            const Text(
              'Transaction',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263A4D),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Color(0xFFA5B0C8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
