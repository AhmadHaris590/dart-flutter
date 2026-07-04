import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String name = "Haris";
  String age = "21";
  String city = "Karachi";

  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }
  void changeAge(String age) {
    this.age = age;
    notifyListeners();
  }
  void changeCity(String city) {
    this.city = city;
    notifyListeners();
  }
}
