import 'package:flutter/material.dart';

// Topics cover in this file
// 1- ListView
// 2- SingleChildScrollView
// 3- Expanded
// 4- In Widget Tree, Constraints go downwards and size goes upwards

class ProfilesView extends StatelessWidget {
  ProfilesView({super.key});

  List<Map<String, String>> profiles = [
    {"name": "Alice", "email": "alice@example.com"},
    {"name": "Bob", "email": "bob@example.com"},
    {"name": "Charlie", "email": "charlie@example.com"},
    {"name": "John", "email": "john@example.com"},
    {"name": "Aana", "email": "aana@example.com"},
    {"name": "Alexa", "email": "alexa@example.com"},
    {"name": "Superman", "email": "superman@example.com"},
    {"name": "Spiderman", "email": "spiderman@example.com"},
    {"name": "Ironman", "email": "ironman@example.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Here we want to scroll the whole page and not just the list of profiles, so we wrap the whole body in a SingleChildScrollView and set the physics of the ListView to NeverScrollableScrollPhysics to disable the scrolling of the ListView and let the SingleChildScrollView handle the scrolling of the whole page. Also we set the shrinkWrap property of the ListView to true to let the ListView take only the space it needs and not the whole available space.
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Text("Following Profiles are special"),
      //       Container(
      //         color: Colors.blue,
      //         child: ListView.builder(
      //           itemCount: profiles.length,
      //           shrinkWrap: true,
      //           physics: NeverScrollableScrollPhysics(),
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text(profiles[index]["name"]!),
      //               subtitle: Text(profiles[index]["email"]!),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // Here we want to scroll only the list of profiles and not the whole page, so we wrap the ListView in an Expanded widget to let it take the remaining space after the Text widget and let the ListView handle its own scrolling. We can also wrap the ListView in SizedBox to give it a fixed height if we want to limit the height of the ListView instead of letting it take the remaining space using Expanded.
      body: Column(
        children: [
          Text("Following Profiles are special"),
          Expanded(
            child: ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(profiles[index]["name"]!),
                  subtitle: Text(profiles[index]["email"]!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
