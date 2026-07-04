import 'package:flutter/material.dart';
// Dialogs are used to show important information or get user input without navigating to a new screen. They can be used for confirmations, alerts, or custom content. In this example, we will create a signout confirmation dialog that simulates a loading state.

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // await Future.delayed(Duration(seconds: 2)); // Simulating a delay before showing the dialog
            bool? result = await singoutConfirmationDialog(context);
            if (result == true) {
              print("User confirmed signout");
            } else if (result == false) {
              print("User canceled signout");
            }
          },
          child: Text("Open Dialog"),
        ),
      ),
    );
  }

  Future<dynamic> singoutConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      // barrierDismissible: false, // Prevents closing the dialog by tapping outside
      builder: (ctx) {
        // return Container(height: 400, width: 400, color: Colors.red);
        return AlertDialog(
          title: Text("Signout Confirmation"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Are you sure you want to sign out?"),
              SizedBox(height: 20),
              CircularProgressIndicator(), // Simulating a loading state
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx, true);
              },
              child: Text("Yes", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx, false);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }
}
