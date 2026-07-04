import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/models/auth_model.dart';
import 'package:provider_learn/services/api_service.dart';

class FetchScreen extends StatelessWidget {
  const FetchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Fetch data using token"))),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<AuthModel>().login("token-haris");
            },
            child: Icon(Icons.send),
          ),
          FloatingActionButton(
            onPressed: () async {
              final data = await context.read<ApiService>().fetchData();
              print(data);
            },
            child: Icon(Icons.get_app),
          ),
        ],
      ),
    );
  }
}
