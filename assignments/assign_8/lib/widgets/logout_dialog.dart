import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../theme/app_colors.dart';

Future<void> showLogoutDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.dialogIconBg,
          child: const Icon(Icons.logout_rounded, color: AppColors.destructive, size: 28),
        ),
        title: const Text(
          'Sign out?',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        content: const Text(
          'Are you sure you want to end your session? You\'ll need to sign back in to access your student portal.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary, height: 1.4),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        actions: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: BorderSide(color: Colors.grey.shade300),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('No, stay'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () {
                    final navigator = Navigator.of(context);
                    Navigator.of(dialogContext).pop();
                    navigator.pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text('Yes, sign out'),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}