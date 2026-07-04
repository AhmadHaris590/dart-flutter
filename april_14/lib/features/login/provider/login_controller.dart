import 'package:april_14/features/login/data/login_repository.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  String? validation() {
    if (emailController.text.isEmpty) {
      return 'Email is required';
    }
    if (passwordController.text.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
  
  Future<bool> submit() async {
    final validationMessage = validation();
    if (validationMessage != null) {
      // Handle validation error (e.g., show a snackbar or dialog)
      print(validationMessage);
      return false;
    }
    
    final response = await LoginRepository().login(emailController.text, passwordController.text);
    print('Login successful: ${response.token}');
    return true;
  }
}