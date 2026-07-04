// TOPICS:
// Function as a Parameter
// OOP - Class
// OOP - Object members (instance variables, methods OR Data, Functions)
// OOP - Constructor (Default, Generative, Named, Factory)
//       - Must Initialize all the non-nullable instance variables before the constructor body starts by using one of the following ways:
//          - Initializing formal parameters in constructors using 'this' keyword (e.g. CarX(this.model, this.color);) - no body needed
//          - Initializer list in the constructor (e.g. CarX(String m, String c) : model = m, color = c;) - no body needed
//          - Or initialize instance variables when declaring them (e.g. String model = "Unknown";) - no body needed
//          - Factory Constructor (e.g. CarX.fromJson(Map<String, dynamic> json) {...})
//
void main() {
  // Function as a Parameter
  // void Function(String) abc = greeting;
  // abc("Abdullah");
  // int Function(int, int) xyz = sumNumbers;
  // int result = sumNumbers(4, 5);
  double res = operateNumbers(
    a: 4,
    b: 5,
    operation: (double x, double y) {
      return x + y;
    },
  );
  print("operate number is $res");
  // List<int> numbers = [1, 2, 3, 4, 5, 6];
  // var newlist = filterNumbers(numbers, (int a) {
  //   return a % 2 == 0;
  // });
  // List<int> integer = [2, 3, 4, 5, 6, 7, 8, 9, 11];
  // List<int> odd = filterNumbers(integer, (int a) => a % 2 != 0);
  // print(odd);

  // OOP
  Map<String, dynamic> carData = {"model": "Toyota", "color": "Red"};
  // CarX car1 = CarX(carData["model"], carData["color"]);
  CarX car1 = CarX.fromJson(carData);
  print(car1.model);

  // List<int> numb = [1, 2, 3, 4, 5, 6, 7, 89, 7, 89, 6, 5, 4, 3, 34];
  // List<int> evenNo = filterNumbers(numb, (num) => num % 3 == 0);
  // print("divisible by 3 are $evenNo");
}

List<int> filterNumbers(List<int> numbers, bool Function(int) filter) {
  List<int> evenNumbers = [];
  for (var number in numbers) {
    if (filter(number)) {
      evenNumbers.add(number);
    }
  }
  return evenNumbers;
}

double operateNumbers({
  required double a,
  required double b,
  required double Function(double, double) operation,
}) {
  return operation(a, b);
}

// double operateNumbers(double a, double b, String sign) {
//   if (sign == "+") {
//     return a + b;
//   } else if (sign == "-") {
//     return a - b;
//   } else if (sign == "*") {
//     return a * b;
//   } else if (sign == "/") {
//     return a / b;
//   } else {
//     throw Exception("Invalid operation");
//   }
// }

void greeting(String name) {
  print("Hello, $name!");
}

int sumNumbers(int a, int b) {
  return a + b;
}

class CarX {
  String model;
  String color;
  // CarX(this.model, this.color) {}
  // CarX(String m, String c) {
  //   model = m;
  //   color = c;
  // }

  CarX(String m, String c) : model = m, color = c;
  // CarX.fromJson(Map<String, dynamic> json)
  //   : model = json["model"],
  //     color = json["color"];
  factory CarX.fromJson(Map<String, dynamic> json) {
    return CarX(json["model"], json["color"]);
  }

  void accelerate() {
    print("The car is accelerating");
  }
}

List<int> filteration(List<int> num, bool Function(int num) operation) {
  List<int> result = [];
  for (var number in num) {
    if (operation(number)) {
      result.add(number);
    }
  }
  return result;
}
