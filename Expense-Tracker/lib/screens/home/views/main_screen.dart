import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/home/views/widgets/custom_app_bar.dart';
import 'package:money_tracker/screens/home/views/widgets/home_card.dart';
import 'package:money_tracker/screens/home/views/widgets/transactions_bar.dart';
import 'package:money_tracker/screens/home/views/widgets/transactions_item.dart';

class MainScreen extends StatelessWidget {
  final List<Expense> expenses;
  const MainScreen(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomAppBar(),
            const SizedBox(height: 20),
            const HomeCard(),
            const SizedBox(height: 40),
            const TransactionsBar(),
            const SizedBox(height: 20),
            TransactionsItem(expenses: expenses)
          ],
        ),
      ),
    );
  }
}
