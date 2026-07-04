import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // app bar (if not exsit, body take whole space)
      appBar: homeAppBar(),
      body: Center(
        // Center the child widget within its space
        child: Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print("Welcome`");
                },
                child: Text(
                  'Hello, world!',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              MyContainer(),
              NotficationIcon(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 40),
                  backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Click me"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      leading: Icon(Icons.person),
      title: Text("Home Screen"),
      actions: [Icon(Icons.settings)],
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("1");
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.purple,
          // border: Border.all(width: 4),
          // shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink, Colors.purple],
          ),
          // border: Border.all(width: 4)
          // border: Border(
          //   top: BorderSide(width: 4),
          //   bottom: BorderSide(width: 8),
          // ),
          // borderRadius: BorderRadius.circular(10),
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
        ),
        child: Center(child: Text("1")),
      ),
    );
  }
}

class NotficationIcon extends StatelessWidget {
  const NotficationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("Notifications");
      },
      icon: Stack(
        children: [
          Icon(Icons.notifications),
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 6, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
