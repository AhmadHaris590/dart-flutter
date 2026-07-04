import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController nameController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter your name"),
          SizedBox(
            width: 200,
            child: TextField(
              controller: nameController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, size: 20),
                // better way to size icon
                // prefixIconConstraints: BoxConstraints(
                //   minHeight: 20,
                //   minWidth: 20,
                // ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print(nameController.text);
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
