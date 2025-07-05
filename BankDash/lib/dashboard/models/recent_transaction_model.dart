import 'package:flutter/material.dart';

class RecentTransactionModel {
  final String title, date, amount, image;
  final Color backgroundColor;
  final bool isWithdrawal;

  const RecentTransactionModel({
    required this.image,
    required this.backgroundColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.isWithdrawal,
  });
}
