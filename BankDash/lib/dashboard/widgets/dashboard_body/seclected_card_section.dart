import 'package:bankdash/dashboard/widgets/dashboard_body/active_inactive_card.dart';
import 'package:flutter/material.dart';

class SelectedCardSection extends StatefulWidget {
  const SelectedCardSection({super.key});

  @override
  State<SelectedCardSection> createState() => _SelectedCardSectionState();
}

class _SelectedCardSectionState extends State<SelectedCardSection> {
  bool isFirstCardActive = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: MyCard(
                key: ValueKey<bool>(isFirstCardActive),
                isActive: isFirstCardActive,
                onTap: () {
                  setState(() {
                    isFirstCardActive = true;
                  });
                },
                title: 'My Cards',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: MyCard(
                key: ValueKey<bool>(!isFirstCardActive),
                isActive: !isFirstCardActive,
                onTap: () {
                  setState(() {
                    isFirstCardActive = false;
                  });
                },
                title: 'See All',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
