import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_portal_final/providers/counter_provider.dart';
import 'package:student_portal_final/screens/dashboard_screen.dart';
import 'package:student_portal_final/screens/login_screen.dart';

// main() is the first function Dart runs.
// runApp() puts the first Flutter widget on the screen.
void main() {
  runApp(
    // ChangeNotifierProvider puts one CounterProvider object above the app.
    // Any screen below this point can listen to it with Consumer.
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const StudentPortalApp(),
    ),
  );
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
