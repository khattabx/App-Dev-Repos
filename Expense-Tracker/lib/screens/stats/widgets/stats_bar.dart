import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatsBar extends StatefulWidget {
  const StatsBar({super.key});

  @override
  State<StatsBar> createState() => _StatsState();
}

class _StatsState extends State<StatsBar> {
  late String todayDate;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDate();
    _startDailyUpdate();
  }

  void _updateDate() {
    setState(() {
      todayDate = DateFormat('E, d MMMM yyyy').format(DateTime.now());
    });
  }

  void _startDailyUpdate() {
    _timer = Timer.periodic(const Duration(hours: 1), (timer) {
      DateTime now = DateTime.now();
      if (now.hour == 0 && now.minute == 0) {
        _updateDate();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          todayDate,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF263A4D),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Total Expenses',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF263A4D).withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
