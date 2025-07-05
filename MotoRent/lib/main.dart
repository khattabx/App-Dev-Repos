import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motorent/injection_container.dart';
import 'package:motorent/presentation/bloc/car_bloc.dart';
import 'package:motorent/presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(primary: Colors.blue),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          textTheme: GoogleFonts.barlowTextTheme(),
        ),
        title: 'MotoRent',
        home: const OnboardingPage(),
      ),
    );
  }
}
