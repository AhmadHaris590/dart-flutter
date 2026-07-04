import 'package:flutter/material.dart';

// StatefulWidget because counter changes.
class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${widget.email}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text('Counter value: $counter'),
            const SizedBox(height: 16),
            const Text(
              'This app covers Dart models, maps, lists, functions, callbacks, enums, async, FutureBuilder, navigation, forms, and setState.',
            ),
          ],
        ),
      ),
    );
  }
}
