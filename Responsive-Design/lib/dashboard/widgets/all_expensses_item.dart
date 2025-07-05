import 'package:dashboard/dashboard/models/all_expensess_item_model.dart';
import 'package:dashboard/dashboard/widgets/inactive_and_active_all_expensess_item.dart';
import 'package:flutter/material.dart';

class AllExpenssesItem extends StatelessWidget {
  const AllExpenssesItem({
    super.key,
    required this.itemModel,
    required this.isSelected,
  });

  final AllExpensessItemModel itemModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: isSelected
          ? ActiveAllExpenssesItem(
              key: const ValueKey('active'), itemModel: itemModel)
          : InActiveAllExpenssesItem(
              key: const ValueKey('inactive'), itemModel: itemModel),
    );
  }
}
