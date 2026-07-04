import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({super.key, required this.initials});

  final String initials;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: AppColors.primary,
      child: Text(
        initials,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
      ),
    );
  }
}

class ProfilePhotoAvatar extends StatelessWidget {
  const ProfilePhotoAvatar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: AppColors.primary.withOpacity(0.12),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? const Icon(Icons.person_rounded, color: AppColors.primary, size: 22)
          : null,
    );
  }
}