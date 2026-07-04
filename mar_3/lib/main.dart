import 'package:flutter/material.dart';
import 'package:mar_3/screens/home/home_screen.dart';
import 'package:mar_3/screens/profiles/profiles_view.dart';
import 'package:mar_3/screens/setting/setting_view.dart';

// Topics cover in this project
// 1. Create a simple home screen
// 2. ListView
// 3- SingleChildScrollView
// 4- Expanded
// 5- In Widget Tree, Constraints go downwards and size goes upwards
// 6- GridView

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SettingView());
  }
}
