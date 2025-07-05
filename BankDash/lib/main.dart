import 'package:bankdash/dashboard/utils/colors.dart';
import 'package:bankdash/dashboard/views/dashboard_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      backgroundColor: ColorsManager.bgColor,
      builder: (context) => const BankDash(),
    ),
  );
}

class BankDash extends StatelessWidget {
  const BankDash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankDash',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.bgColor,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const DashboardView(),
    );
  }
}
