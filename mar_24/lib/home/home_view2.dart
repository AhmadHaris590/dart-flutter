import 'package:flutter/material.dart';
import 'package:mar_24/home/home_view1.dart';

// Drawer & Navigations

class HomeView2 extends StatelessWidget {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer Learning")),
      body: Center(
        child: Builder(
          builder: (ctx) {
            return ElevatedButton(
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
              child: Text("Open Drawer"),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Header")),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => HomeView1()),
                );

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (ctx) => HomeView1()),
                // );

                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (ctx) => HomeView1()),
                //   (route) => false, // Remove all previous routes
                // );
              },
            ),
            ListTile(title: Text("Item 3")),
          ],
        ),
      ),
    );
  }
}
