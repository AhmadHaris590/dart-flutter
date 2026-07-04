import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  String? _token;
  String? get tokenget => _token;

  void login(String login) {
    this._token = login;
    notifyListeners();
  }
}
