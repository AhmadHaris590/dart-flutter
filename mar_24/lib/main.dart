import 'package:flutter/material.dart';
import 'package:mar_24/home/home_view.dart';
import 'package:mar_24/home/home_view1.dart';
import 'package:mar_24/home/home_view2.dart';
import 'package:mar_24/home/home_view3.dart';
import 'package:mar_24/home/home_view4.dart';
import 'package:mar_24/home/home_view5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView5());
  }
}
