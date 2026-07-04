import 'package:april_7/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<Counter>(context);
    print('SettingsView build method called');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        // child: Consumer<Counter>(
        //   builder: (context, counter, child) {
        //     print('Consumer builder called');
        //     return Text('Counter value: ${counter.count}');
        //   },
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<Counter>(
                  context,
                  listen: false,
                ).updateOtherVariable("Bye");
              },
              child: Text("Update other variable of Counter"),
            ),
            SizedBox(height: 20),
            Selector<Counter, int>(
              selector: (context, counter) => counter.count,
              builder: (context, count, child) {
                print('Selector builder called');
                return Text('Counter value: $count');
              },
              // Expensive Widget that doesn't depend on Counter's count variable
              // child: Text('This is an expensive widget'),
            ),
          ],
        ),
      ),
    );
  }
}
