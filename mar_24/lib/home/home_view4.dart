import 'package:flutter/material.dart';

class HomeView4 extends StatelessWidget {
  HomeView4({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter your username"),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text("Enter your password"),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    bool? result = formKey.currentState?.validate();
                    if (result == true) {
                      // Form is valid, proceed with login
                      String username = usernameController.text;
                      String password = passwordController.text;
                      print("Username: $username, Password: $password");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Please fix the errors in the form"),
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
