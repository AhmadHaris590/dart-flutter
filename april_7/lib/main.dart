import 'package:april_7/ui/home/home_view.dart';
import 'package:april_7/ui/profile/profile_view.dart';
import 'package:april_7/ui/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Topics covered in this code:
// State Management Needs:
// 1. Sharing data across the widget tree
// 2. Updating UI when data changes
// 3. Avoiding unnecessary rebuilds
// 4. Separating business logic from UI

// Provider Package:
// 1. A wrapper around InheritedWidget to make state management easier
// 2. Provider Basics
// 3. ChangeNotifierProvider
// 4. MultiProvider
// 5. ProxyProvider
// 6. Consumer Widget
// 7. Selector Widget

void main() {
  // runApp(Provider<User>(
  //   create: (_) => User('Huzaifa'),
  //   child: Provider<Car>(
  //     create: (_) => Car('Tesla'),
  //     child: const MyApp())));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<User>(
          create: (_) => User('Huzaifa'),
          lazy: false,
        ),
        ChangeNotifierProvider<Counter>(create: (_) => Counter()),
        // Provider<Car>(create: (_) => Car('Tesla')),
        ProxyProvider<User, Greeting>(
          update: (_, user, __) => Greeting('Hello ${user.name}'),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class Greeting {
  final String message;
  Greeting(this.message);
}

class User extends ChangeNotifier {
  String name;

  User(this.name) {
    print("User is create");
  }

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }
}

class Counter extends ChangeNotifier {
  int count = 0;
  String otherVariable = 'Hello';

  Counter();

  void increment() {
    count++;
    notifyListeners();
  }

  void updateOtherVariable(String newValue) {
    otherVariable = newValue;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProfileView());
  }
}