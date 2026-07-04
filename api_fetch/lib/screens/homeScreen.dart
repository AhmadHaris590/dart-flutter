import 'package:api_fetch/screens/api1.dart';
import 'package:api_fetch/screens/bar.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;
  final List<Widget> screens = [Home(), Api1(),Bar()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text("Home Screen"),
        backgroundColor: Colors.blueGrey,
        elevation: 1000,
        centerTitle: true,
        actions: [Icon(Icons.settings)],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'api'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'bar'),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Api1()),
              // );

              Navigator.pushNamed(context, "/api", arguments: 'Simple Crud');
            },
            child: Text("Api Screen"),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/row");
          },
          child: Text("Row"),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/tab");
          },
          child: Text("tab"),
        ),
      ],
    );
  }
}
