import 'package:flutter/material.dart';

// This screen exists only for learning widgets.
// It shows GridView, Row, Container, Image.network, SingleChildScrollView,
// Stack, and Positioned in one place.
class WidgetsGalleryScreen extends StatelessWidget {
  const WidgetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Row + Container'),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(width: 60, height: 60, color: Colors.indigo),
                const SizedBox(width: 8),
                Container(width: 60, height: 60, color: Colors.amber),
                const SizedBox(width: 8),
                Container(width: 60, height: 60, color: Colors.pink),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Image.network + Stack + Positioned'),
            const SizedBox(height: 8),
            Stack(
              children: [
                Image.network(
                  'https://picsum.photos/600/240',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    color: Colors.black87,
                    child: const Text(
                      'Positioned label',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('GridView inside a fixed height box'),
            const SizedBox(height: 8),
            SizedBox(
              height: 260,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  for (int i = 0; i < colors.length; i++)
                    Container(
                      color: colors[i],
                      child: Center(
                        child: Text(
                          'Box ${i + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
