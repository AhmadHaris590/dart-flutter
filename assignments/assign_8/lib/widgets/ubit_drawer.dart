import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'logout_dialog.dart';

class UbitDrawer extends StatelessWidget {
  const UbitDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              decoration: const BoxDecoration(color: Colors.white),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'UBIT Hub',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: AppColors.primary),
              title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.w600)),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded, color: AppColors.primary),
              title: const Text('About', style: TextStyle(fontWeight: FontWeight.w600)),
              onTap: () => Navigator.of(context).pop(),
            ),
            const Spacer(),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: AppColors.destructive),
              title: const Text('Log Out', style: TextStyle(color: AppColors.destructive, fontWeight: FontWeight.w700)),
              onTap: () {
                Navigator.of(context).pop();
                showLogoutDialog(context);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}