import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/screens/home/blocs/get_expense_bloc/get_expenses_bloc.dart';
import 'package:money_tracker/screens/home/views/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
        colorScheme: const ColorScheme.light(
            surface: Color(0xFFF3F5F7),
            onSurface: Colors.black,
            primary: Color(0xFF00B2E7),
            secondary: Color(0xFFE064F7),
            tertiary: Color(0xFFFF8D6C),
            outline: Colors.grey),
      ),
      home: BlocProvider(
        create: (context) => GetExpensesBloc(
          FirebaseExpenseRepo(),
        )..add(GetExpenses()),
        child: const HomeScreen(),
      ),
    );
  }
}
