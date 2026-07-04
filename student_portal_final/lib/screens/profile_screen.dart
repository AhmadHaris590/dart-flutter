import 'package:flutter/material.dart';
import 'package:student_portal_final/models/user_role.dart';

// StatelessWidget because it only displays values passed from outside.
class ProfileScreen extends StatelessWidget {
  final String email;
  final UserRole role;

  const ProfileScreen({
    super.key,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.account_circle, size: 80),
            const SizedBox(height: 16),
            Text('Email: $email'),
            Text('Role: ${roleLabel(role)}'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
