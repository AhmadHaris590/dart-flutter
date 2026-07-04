import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PrivacyNoteCard extends StatelessWidget {
  const PrivacyNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: AppColors.primary, width: 4)),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy Note',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppColors.textPrimary),
          ),
          SizedBox(height: 6),
          Text(
            'Department information is used for course recommendations and verified '
            'campus communications. You can update it anytime.',
            style: TextStyle(fontSize: 12, height: 1.4, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}