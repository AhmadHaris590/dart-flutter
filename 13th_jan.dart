import 'dart:io';

void main() {
  List<String> stdNames = ["Abid", "Faiq", "Ali", "Shahzaib"];
  List<int> stdMarks = [80, 75, 90];
  List<String> stdDob = ["18 Jan 2004", "17 Mar 2002", "29 Feb 2002"];

  print(stdNames[2]);
  print(stdMarks[2]);
  print(stdDob[2]);
  // using multiple lists is not a good practice
  // instead we use maps or classes to store related data

  Map<String, dynamic> stdDetail = {
    "name": "Shahzaib",
    "marks": 90,
    "dob": "29 Feb 2002",
  };
  stdDetail["CNIC"] = "345kljlsdkf"; // add or update value of key
  stdDetail.remove("marks");
  print("stdetail dob : ${stdDetail["dob"]}");

  List<Map<String, dynamic>> students = [
    {"name": "Abid", "marks": 90},
    {"name": "Faiq", "marks": 50},
    {"name": "Abdullah", "marks": 85},
  ];
  // print(stdDetail.length);

  // I want to get marks of Abdullah
  //    ---stdudents[2]--- gives me the map of Abdullah
  //    ---["marks"]--- gives me the marks from that map
  print(students[2]["marks"]);

  // List<Map<String, dynamic>> users = [
  //   {"name":"ahmad",
  //    "dob":"26-jan-2005",
  //    "age":21,
  //   },
  //   {
  //    "name":"ahmad",
  //    "dob":"26-jan-2005",
  //    "age":21,
  //   }
  //   ];

  int a = 5;
  dynamic b = 4;

  if (b > a) {
    print("B is greater");
  } else if (a > b) {
    print("A is greater");
  } else if (a == b) {
    print("both are equal");
  } else {
    print("a and b are of different types");
  }

  List<String> names = ["faiq", "abid", "ali"];

  // flow of for loop: 1) initialization 2) condition check 3) loop body execution 4) increment/decrement
  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }

  for (int i = names.length - 1; i >= 0; i--) {
    print(names[i]);
  }

  String userInput =
      ""; // we have to define userInput before the loop (due to scope)
  do {
    print("Enter input");
    userInput = stdin.readLineSync()!;
  } while (userInput != "flutter");

  int l = 0;
  do {
    l++;
    print("last while ${names[l]}");
  } while (names[l] == "abid");
}
