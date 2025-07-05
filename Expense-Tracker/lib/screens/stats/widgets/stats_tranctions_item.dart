import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class StatsTranctionsItem extends StatelessWidget {
  const StatsTranctionsItem({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, int i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(expenses[i].category.color),
                                  shape: BoxShape.circle),
                            ),
                            Image.asset(
                              'assets/images/${expenses[i].category.icon}.png',
                              scale: 2,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(width: 12),
                        Text(
                          expenses[i].category.name,
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "-\$${expenses[i].amount}.00",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w400),
                        ),
                        // Text(
                        //   DateFormat('dd/MM/yyyy').format(expenses[i].date),
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       color: Theme.of(context).colorScheme.outline,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
