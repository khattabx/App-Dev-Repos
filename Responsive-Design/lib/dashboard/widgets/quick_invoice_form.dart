import 'package:dashboard/dashboard/widgets/custom_botton.dart';
import 'package:dashboard/dashboard/widgets/title_text_field.dart';
import 'package:flutter/material.dart';

class QuickInvoiceForm extends StatelessWidget {
  const QuickInvoiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: TitleTextField(
                title: 'Customer Name',
                hint: 'Type Customer Name',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TitleTextField(
                title: 'Customer Email',
                hint: 'Type Customer Email',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Expanded(
              child: TitleTextField(
                title: 'Item Name',
                hint: 'Type Item Name',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TitleTextField(
                title: 'Item Mount',
                hint: 'USD',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: CustomBotton(
                backgroundColor: Colors.transparent,
                textColor: const Color(0xFF4DB7F2),
                title: 'Add more details',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomBotton(
                backgroundColor: const Color(0xFF4DB7F2),
                title: 'Send Money',
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
