import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const UbitStudentHubApp());
}

class UbitStudentHubApp extends StatelessWidget {
  const UbitStudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UBIT Hub',
      debugShowCheckedModeBanner: false,
      theme: buildUbitTheme(),
      home: const LoginScreen(),
    );
  }
}