import 'package:flutter/material.dart';

// DropDown

class HomeView1 extends StatefulWidget {
  HomeView1({super.key});

  @override
  State<HomeView1> createState() => _HomeView1State();
}

class _HomeView1State extends State<HomeView1> {
  
  String? selectedCountry;
  List<String> countries = ["USA", "Canada", "UK"];

  Person? selectedPerson;
  List<Person> people = [
    Person(id: 1, name: "Alice"),
    Person(id: 2, name: "Bob"),
    Person(id: 3, name: "Charlie"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropDown Learning")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select your country"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                value: selectedCountry,
                isExpanded: true,
                underline: SizedBox(),
                padding: EdgeInsets.only(left: 16),
                items: countries.map((country) {
                  return DropdownMenuItem(value: country, child: Text(country));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text("Select a person"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                value: selectedPerson,
                isExpanded: true,
                underline: SizedBox(),
                padding: EdgeInsets.only(left: 16),
                items: people.map((person) {
                  return DropdownMenuItem(value: person, child: Text(person.name));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPerson = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Person {
  int id;
  String name;

  Person({required this.id, required this.name});
}