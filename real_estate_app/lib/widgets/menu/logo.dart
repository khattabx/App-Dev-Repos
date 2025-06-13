import 'package:flutter/material.dart';
import 'package:real_estate_app/constans.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: kSecondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 2),
            const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 100.0,
            ),
            const Spacer(),
            Text(
              'Real Estate',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Text(
              'Modern home with \n greater interior design',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
