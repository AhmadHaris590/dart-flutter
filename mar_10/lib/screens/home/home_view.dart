import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final int initialCounter;
  const HomeView({super.key, required this.initialCounter});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int counter = 0;

  @override
  void initState() {
    print("Init state called");
    counter = widget.initialCounter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build method called");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text(counter.toString())),
    );
  }
}
