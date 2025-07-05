import 'package:flutter/material.dart';

import 'package:dashboard/dashboard/widgets/coustom_background_container.dart';
import 'package:dashboard/dashboard/widgets/latest_transction.dart';
import 'package:dashboard/dashboard/widgets/quick_invoice_form.dart';
import 'package:dashboard/dashboard/widgets/quick_invoice_header.dart';

class QuickInvoive extends StatelessWidget {
  const QuickInvoive({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoustomBackgroundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuickInvoiveHeader(),
          SizedBox(height: 16),
          LatestTransction(),
          Divider(height: 48, color: Color(0xFFF1F1F1)),
          QuickInvoiceForm(),
        ],
      ),
    );
  }
}
