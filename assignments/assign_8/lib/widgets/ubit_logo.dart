import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class UbitLogo extends StatelessWidget {
  const UbitLogo({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.school_rounded, color: AppColors.primary, size: compact ? 22 : 28),
        const SizedBox(width: 8),
        Text(
          'UBIT Hub',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: compact ? 16 : 20,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}