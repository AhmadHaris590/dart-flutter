import 'package:april_7/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final greeting = Provider.of<Greeting>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<User>(context, listen: false).updateName('Ali ');
        },
        child: const Icon(Icons.update),
      ),
      body: Center(child: Text(greeting.message)),
    );
  }
}
