import 'package:flutter/material.dart';

// Radio Button & CheckBox
class HomeView3 extends StatefulWidget {
  HomeView3({super.key});

  @override
  State<HomeView3> createState() => _HomeView3State();
}

class _HomeView3State extends State<HomeView3> {
  String? selectedGender;

  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radio Button & CheckBox Learning")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select your gender"),
            RadioGroup(
              groupValue: selectedGender,
              onChanged: (value) {
                print(value);
                setState(() {
                  selectedGender = value;
                });
              },
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Radio(value: "male"),
              //     Text("Male"),
              //     SizedBox(width: 20),
              //     Radio(value: "female"),
              //     Text("Female"),
              //   ],
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile(value: "male", title: Text("Male")),
                  RadioListTile(value: "female", title: Text("Female")),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Checkbox(
                //   value: isTermsAccepted,
                //   onChanged: (value) {
                //     if (value == null) return;
                //     setState(() {
                //       isTermsAccepted = value;
                //     });
                //   },
                // ),
                // Text("Accept Terms & Conditions"),
                CheckboxListTile(
                  value: isTermsAccepted,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      isTermsAccepted = value;
                    });
                  },
                  title: Text("Accept Terms & Conditions"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
