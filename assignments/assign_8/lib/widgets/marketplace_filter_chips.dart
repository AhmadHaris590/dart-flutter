import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class MarketplaceFilterChips extends StatelessWidget {
  const MarketplaceFilterChips({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(right: i == labels.length - 1 ? 0 : 10),
            child: Material(
              color: selected ? AppColors.primary : AppColors.chipUnselected,
              borderRadius: BorderRadius.circular(22),
              child: InkWell(
                onTap: () => onSelected(i),
                borderRadius: BorderRadius.circular(22),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Text(
                    labels[i],
                    style: TextStyle(
                      color: selected ? Colors.white : AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}