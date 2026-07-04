import 'package:flutter/material.dart';

// Topics Cover in this file
// 1- GridView


class SettingView extends StatelessWidget {
  SettingView({super.key});

  List<Container> containers = [
    Container(height: 100, color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.orange),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GridView(
      //   // scrollDirection: Axis.vertical, // default is vertical

      //   // we use this gridDelegate when we want to specify the number of columns if scrollDirection is vertical otherwise number of rows
      //   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   //   crossAxisCount: 3, // number of columns if scrollDirection is vertical otherwise number of rows
      //   //   mainAxisSpacing: 8, // vertical spacing if scrollDirection is vertical otherwise horizontal spacing
      //   //   crossAxisSpacing: 4, // horizontal spacing if scrollDirection is vertical otherwise vertical spacing
      //   //   // width / height ratio (means the width of the item is 2 times the height)
      //   //   childAspectRatio: 2 / 1,
      //   // ),

      //   // we use this gridDelegate when we want to specify the maximum width of the item if scrollDirection is vertical otherwise maximum height of the item
      //   // and let the grid calculate the number of columns if scrollDirection is vertical otherwise number of rows
      //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent:
      //         200, // maximum width of the item if scrollDirection is vertical otherwise maximum height of the item
      //     mainAxisSpacing:
      //         8, // vertical spacing if scrollDirection is vertical otherwise horizontal spacing
      //     crossAxisSpacing:
      //         4, // horizontal spacing if scrollDirection is vertical otherwise vertical spacing
      //     // width / height ratio (means the width of the item is 2 times the height)
      //     childAspectRatio: 2 / 1, // In maxcrossAxisExtentDelegate, the childAspectRatio is used to calculate the height of the item based on the maxCrossAxisExtent and the aspect ratio. For example, if maxCrossAxisExtent is 200 and childAspectRatio is 2/1, then the height of the item will be 100 (200 / (2/1) = 100).
      //   ),

      //   children: containers,
      // ),
      // equivalent to the above GridView with SliverGridDelegateWithFixedCrossAxisCount
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio:
            100 /
            200, // width / height ratio (means the height of the item is 2 times the width)
        children: containers,
      ),

      // equivalent to the above GridView with SliverGridDelegateWithMaxCrossAxisExtent
      // body: GridView.extent(
      //   maxCrossAxisExtent: 200,
      // children: containers),
    );
  }
}
