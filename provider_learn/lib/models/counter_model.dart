import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); //tell all the listeners "data changed, rebuild!!"
  }

  void decrement() {
    _count>0?_count--: _count;
    notifyListeners();
  }
}
