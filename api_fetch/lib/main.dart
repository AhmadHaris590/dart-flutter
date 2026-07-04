import 'package:api_fetch/screens/api1.dart';
import 'package:api_fetch/screens/bar.dart';
import 'package:api_fetch/screens/homeScreen.dart';
import 'package:api_fetch/screens/listRow.dart';
import 'package:api_fetch/screens/tabBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice",
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        // "/":(context)=>Homescreen(),
        "/api":(context)=>Api1(),
        "/bar":(context)=>Bar(),
        "/row":(context)=>Listrow(),
        "/tab":(context)=>Tabbar(),
      },
    );
  }
}
