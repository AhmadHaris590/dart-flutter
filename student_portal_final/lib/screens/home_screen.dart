import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_portal_final/providers/counter_provider.dart';

// StatelessWidget is enough here because Provider stores the counter.
// The widget does not need its own int counter variable anymore.
class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // read() calls the provider method one time.
          // It does not rebuild this button when the value changes.
          context.read<CounterProvider>().increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, $email',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Consumer listens to CounterProvider.
            // When notifyListeners() runs, only this part rebuilds.
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                return Text('Provider counter: ${counterProvider.count}');
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Tap +. The number changes because CounterProvider calls notifyListeners().',
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CounterProvider>().reset();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Reset provider counter'),
            ),
          ],
        ),
      ),
    );
  }
}
