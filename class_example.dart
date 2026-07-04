import 'dart:convert';

import 'assignments/assign6.dart';

class Rectangle {
  double? length;
  double? breath;

  Rectangle(double length, [double? breath = 10]) {
    print("constructor is called");
    this.length = length;
    this.breath = breath;
  }

  void display() {
    print("area of rectangle is ${length! * breath!}");
  }
}

List<int> Filter(List<int> numbers, bool Function(int) filter) {
  List<int> result = [];
  for (int number in numbers)
    if (filter(number)) {
      result.add(number);
    }

  return result;
}

double operation(
    double num1, double num2, double Function(double a, double b) result) {
  return result(num1, num2);
}

class Car {
  String? name;
  String? model;
  String? hp;

  Car(this.name, this.model, this.hp);

  Car.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        model = json["map"],
        hp = json["hp"];

  factory Car.fromJsonString(String jsonString){
    Map<String,dynamic> json=jsonDecode(jsonString);
    return Car(json["name"], json["model"],json["hp"]);
  }
}

void main() {
  Rectangle rectangle1 = Rectangle(10, 20);
  rectangle1.display();

  List<int> no = [1, 2, 3, 4, 5, 56, 7, 8, 9];
  List<int> evenNumber = Filter(no, (int a) => a % 2 == 0);
  print(evenNumber);

  print("result of 1+2 is ${operation(1, 2, (a, b) {
    return a + b;
  })}");
}
