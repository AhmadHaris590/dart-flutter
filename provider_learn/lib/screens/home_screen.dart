import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/models/counter_model.dart';
import 'package:provider_learn/models/user-model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterProvider = Provider.of<CounterModel>(context);  // equivalent to context.watch — SUBSCRIBES (listen: true is default)
    // final counterProvider = Provider.of<CounterModel>(context,listen: false);  // equivalent to context.read — does NOT subscribe

    print("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Selector<UserModel, String>(
          selector: (context, user) => user.name,
          builder: (context, name, child) {
            print("homeScreen user model called, selector name");
            return Text(name);
          },
        ),
      ),
      body:
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     //-------------- WITHOUT CONSUMER-----------------
          //     Center(child: Text("Count Without consumer")),
          //     Center(
          //       child: Text(
          //         context
          //             .watch<CounterModel>()
          //             .count
          //             .toString(), // <- listen/rebuild!!
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     SizedBox(height: 100),
          //     ElevatedButton(
          //       onPressed: () {
          //         context
          //             .read<CounterModel>()
          //             .increment(); // read the counter model and call its increment method
          //       },
          //       child: Icon(Icons.add),
          //     ),
          //     SizedBox(height: 20),
          //     ElevatedButton(
          //       onPressed: () {
          //         context.read<CounterModel>().decrement();
          //       },
          //       child: Icon(Icons.remove),
          //     ),
          //     Divider(height: 40),
          //   ],
          // ),
          //-------------- WITH CONSUMER-----------------
          Consumer<CounterModel>(
            builder: (context, value, child) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          
                        }, child:Text("Fetch Screen")),
                        ElevatedButton(onPressed: (){
                          
                        }, child:Text("profile")),
                      ],
                    ),
                  ),
                  Center(child: Text("Count With consumer")),
                  Center(
                    child: Text(
                      value.count.toString(), // <- listen/rebuild!!
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      value
                          .increment(); // read the counter model and call its increment method
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      value.decrement();
                      String name = context.read<UserModel>().name;
                      context.read<UserModel>().changeName(
                        name=="haris" ? "ahmad" : "haris",
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              );
            },
          ),
    );
  }
}
