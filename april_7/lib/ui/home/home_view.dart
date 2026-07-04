import 'package:april_7/main.dart';
import 'package:april_7/ui/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Hello, ${user.name}')),
          // button to navigate to settings view
          ElevatedButton(
            onPressed: () {
              user.updateName('Ali');
              print(user.name);
              print(Provider.of<User>(context, listen: false).name);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsView()),
              // );
            },
            child: const Text('Update User Data'),
          ),
        ],
      ),
    );
  }
}
