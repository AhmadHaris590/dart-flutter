import 'package:api_fetch/screens/ListRow.dart';
import 'package:api_fetch/screens/api1.dart';
import 'package:api_fetch/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
                Tab(icon: Icon(Icons.home), text: "home"),
                Tab(icon: Icon(Icons.video_camera_back_sharp), text: "reels"),
                Tab(icon: Icon(Icons.message), text: "Inbox"),
                ],
          ),
        ),
        body: TabBarView(
            children:[
                Homescreen(),
                Api1(),
                Listrow(),
            ]
            ),
      ),
    );
  }
}
