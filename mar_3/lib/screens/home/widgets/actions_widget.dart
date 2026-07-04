import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(label: "CALL", icon: Icons.call),
        ActionButton(label: "ROUTE", icon: Icons.near_me),
        ActionButton(label: "SHARE", icon: Icons.share),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const ActionButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}