import 'package:dashboard/dashboard/widgets/income_section_body.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/dashboard/widgets/coustom_background_container.dart';
import 'package:dashboard/dashboard/widgets/income_section_header.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoustomBackgroundContainer(
      child: Column(
        children: [
          IncomeSectionHeader(),
          IncomeSectionBody(),
        ],
      ),
    );
  }
}
