import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartDetails extends StatefulWidget {
  const ChartDetails({
    super.key,
  });

  @override
  State<ChartDetails> createState() => _ChartDetailsState();
}

class _ChartDetailsState extends State<ChartDetails> {
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    endDate = startDate.add(const Duration(days: 30));
  }

  @override
  Widget build(BuildContext context) {
    String formattedStartDate = DateFormat('MMM yyyy').format(startDate);
    String formattedEndDate = DateFormat('MMM yyyy').format(endDate);
    String formattedDateRange = '01 $formattedStartDate - 01 $formattedEndDate';

    return Container(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        top: 20.0,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Text(
            formattedDateRange,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF263A4D).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '\$ 3000.00',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263A4D),
            ),
          ),
        ],
      ),
    );
  }
}
