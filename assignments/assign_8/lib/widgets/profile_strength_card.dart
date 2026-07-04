import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProfileStrengthCard extends StatelessWidget {
  const ProfileStrengthCard({super.key, required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    final clamped = percent.clamp(0.0, 1.0);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -8,
            bottom: -8,
            child: Icon(Icons.person_outline_rounded, size: 96, color: Colors.white.withOpacity(0.08)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile Strength',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '${(clamped * 100).round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 34,
                  height: 1,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: clamped,
                  minHeight: 8,
                  backgroundColor: Colors.white.withOpacity(0.25),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Complete your profile to unlock marketplace perks and faster advising.',
                style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12, height: 1.35),
              ),
            ],
          ),
        ],
      ),
    );
  }
}