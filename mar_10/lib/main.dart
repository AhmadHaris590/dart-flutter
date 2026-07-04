import 'package:flutter/material.dart';
import 'package:mar_10/screens/dashboard/dashboard_view.dart';
import 'package:mar_10/screens/home/home_view.dart';
import 'package:mar_10/screens/profile/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DashboardView());
  }
}
