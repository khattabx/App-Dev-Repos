import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_application_3/widgets/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(),
      body: HomeBody(),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'Welcome to our E Store',
        style: GoogleFonts.getFont('Rubik',
            fontWeight: FontWeight.bold, color: kPrimaryColor),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: kPrimaryColor,
            weight: 25,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
