import 'package:flutter/material.dart';
import 'package:student_portal_final/screens/dashboard_screen.dart';
import 'package:student_portal_final/screens/login_screen.dart';

// main() is the first function Dart runs.
// runApp() puts the first Flutter widget on the screen.
void main() {
  runApp(const StudentPortalApp());
}

// This is the root widget of the app.
// StatelessWidget is enough because this widget does not store changing data.
class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp gives the app routes, themes, navigation, and Material UI.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
