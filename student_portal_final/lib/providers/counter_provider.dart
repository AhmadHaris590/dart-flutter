import 'package:flutter/foundation.dart';

// Provider topic:
// ChangeNotifier is a class that can say, "Hey UI, my data changed."
// CounterProvider stores counter data for the app.
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  // Getter: other files can read count, but cannot directly edit _count.
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
