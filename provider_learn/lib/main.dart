import 'package:flutter/material.dart';
import 'package:provider_learn/models/auth_model.dart';
import 'package:provider_learn/models/counter_model.dart';
import 'package:provider_learn/models/user-model.dart';
import 'package:provider_learn/screens/fetch_screen.dart';
import 'package:provider_learn/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/screens/profile_screen.dart';
import 'package:provider_learn/services/api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (_)=>AuthModel()),
        ProxyProvider<AuthModel, ApiService>(
                // AuthModel = what I depend on
                // ApiService = what I'm creatin
          update: (context, authmodel, previousApiService) {
            return ApiService(authmodel.tokenget);
                // update runs every time AuthModel changes
                // auth is the current AuthModel instance — you can read .token from it
                // previousApiService is the old ApiService (useful if you want to reuse/update it instead of recreating)
                // When user logs in → AuthModel fires notifyListeners() → ProxyProvider runs update → ApiService is recreated with new token
          },
        ),
      ],
      child: MyApp(),
    ),

    // ------SINGLE PROVIDER
    // ChangeNotifierProvider(
    //   create: (_) =>CounterModel(), // create one instance for the whole project
    //   child: MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider',
      home: HomeScreen(),
    );
  }
}
