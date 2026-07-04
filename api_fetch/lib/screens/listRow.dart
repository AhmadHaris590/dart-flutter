import 'package:flutter/material.dart';

class Listrow extends StatelessWidget {
  const Listrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 3, child: Container(color: Colors.grey)),
          Expanded(flex: 2, child: Container(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}
