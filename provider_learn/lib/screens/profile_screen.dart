import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/models/user-model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserModel>(
          builder: (context, value, child) {
            return Center(child: Text(value.name));
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<UserModel>(
                  builder: (context, usermodel, child) {
                    return Text(usermodel.age.toString());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<UserModel>(
                  builder: (context, usermodel, child) {
                    return Text(usermodel.city);
                  },
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your Name',
              hintText: 'e.g Ahmad',
              border: OutlineInputBorder(),
            ),
            controller: nameController,
            onSubmitted: (_) {
              context.read<UserModel>().changeName(nameController.text);
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your age',
              hintText: 'e.g 21',
              border: OutlineInputBorder(),
            ),
            controller: ageController,
            onSubmitted: (_) {
              context.read<UserModel>().changeAge(ageController.text);
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your City',
              hintText: 'e.g Karachi',
              border: OutlineInputBorder(),
            ),
            controller: cityController,
            onSubmitted: (_) {
              context.read<UserModel>().changeCity(cityController.text);
            },
          ),
        ],
      ),
    );
  }
}
