import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Oeschinen Lake Campground"),
              Text("Kandersteg, Switzerland"),
            ],
          ),
        ),
        Icon(Icons.star, color: Colors.red),
        SizedBox(width: 8),
        Text("41"),
      ],
    );
  }
}