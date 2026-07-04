import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 3,
    //   child:
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Settings"),
      //   bottom: TabBar(
      //     controller: tabController,
      //     tabs: [
      //       Tab(icon: Icon(Icons.person), text: "Profile"),
      //       Tab(icon: Icon(Icons.security), text: "Security"),
      //       Tab(icon: Icon(Icons.notifications), text: "Notifications"),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Tab(icon: Icon(Icons.person), text: "Profile"),
              Tab(icon: Icon(Icons.security), text: "Security"),
              Tab(icon: Icon(Icons.notifications), text: "Notifications"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Center(child: Text("Profile Settings")),
                Center(child: Text("Security Settings")),
                Center(child: Text("Notification Settings")),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Center(child: Text("Footer")),
          ),
        ],
      ),
      // ),
    );
  }
}
