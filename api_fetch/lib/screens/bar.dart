import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.all(59),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Text("data"),
          ),
          Positioned(
            bottom: 5, // 10px from bottom
            right: 20, // 20px from right
            child: Icon(Icons.star, color: Colors.pinkAccent),
          ),
          Container(
            width: 20,
            height: 20,
            color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
