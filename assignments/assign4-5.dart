// ============================================================
// Assignment 4 & 5 - Dart Programming Problems
// ============================================================

void main() {
  
  // ============================================================
  // Problem 1: User Input Validation (Logic + Null Safety + Type Casting)
  // ============================================================
  
  print("=== Problem 1: User Input Validation ===");
  List<String> inputs = ["25", "abc", "42", "", "18"];
  List<int> validNumbers = [];
  
  for (String input in inputs) {
    int? parsedValue = int.tryParse(input);
    
    if (parsedValue != null) {
      print("Valid number: $parsedValue");
      validNumbers.add(parsedValue);
    }
  }
  
  print("Total valid numbers = ${validNumbers.length}");
  
  
  // ============================================================
  // Problem 2: Loop Control (break & continue)
  // ============================================================
  
  print("\n=== Problem 2: Loop Control ===");
  for (int i = 1; i <= 20; i++) {
    if (i >= 15) {
      break; // Stop completely when number reaches 15
    }
    
    if (i % 3 == 0) {
      continue; // Skip numbers divisible by 3
    }
    
    print(i);
  }
  
  
  // ============================================================
  // Problem 3: Safe Division (Error Handling)
  // ============================================================
  
  print("\n=== Problem 3: Safe Division ===");
  List<int> divisors = [2, 1, 0, 4];
  int number = 20;
  
  for (int divisor in divisors) {
    try {
      if (divisor == 0) {
        throw Exception("Division by zero");
      }
      int result = number ~/ divisor;
      print("$number / $divisor = $result");
    } catch (e) {
      print("You cannot divide by zero");
    }
  }
  
  
  // ============================================================
  // Problem 4: Function as a Parameter (Logic Design)
  // ============================================================
  
  print("\n=== Problem 4: Function as a Parameter ===");
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  List<int> evenNumbers = processNumbers(numbers, isEven);
  print("Even numbers: $evenNumbers");
  
  List<int> greaterThanFive = processNumbers(numbers, isGreaterThanFive);
  print("Numbers greater than 5: $greaterThanFive");
  
  
  // ============================================================
  // Problem 5: Car Data Processing (OOP + Factory Constructor)
  // ============================================================
  
  print("\n=== Problem 5: Car Data Processing ===");
  List<Map<String, dynamic>> carsJson = [
    {'model': 'Toyota', 'color': 'Red'},
    {'model': 'Honda', 'color': 'Black'},
    {'model': 'Suzuki', 'color': 'White'}
  ];
  
  for (Map<String, dynamic> carData in carsJson) {
    Car car = Car.fromJson(carData);
    car.display();
  }
  
  
  // ============================================================
  // Problem 6: Function + OOP Combined (Logic Layer Simulation)
  // ============================================================
  
  print("\n=== Problem 6: Function + OOP Combined ===");
  List<Map<String, dynamic>> carsJson2 = [
    {'model': 'Toyota', 'color': 'Red'},
    {'model': 'Honda', 'color': 'Black'},
    {'model': 'Suzuki', 'color': 'White'}
  ];
  
  List<Car> cars = createCars(carsJson2);
  
  print("Cars created using createCars function:");
  for (Car car in cars) {
    car.display();
  }
  
  
  // ============================================================
  // Problem 7: Dynamic vs Object (Concept Check in Code)
  // ============================================================
  
  print("\n=== Problem 7: Dynamic vs Object ===");
  
  // Using dynamic - can change type
  dynamic dynamicVar = 42;
  print("Dynamic variable (int): $dynamicVar");
  
  dynamicVar = "Hello Dart";
  print("Dynamic variable (String): $dynamicVar");
  
  // Using Object - requires type casting
  Object objectVar = 100;
  print("Object variable: $objectVar");
  
  // Type casting to access integer-specific property
  if (objectVar is int) {
    int castedValue = objectVar as int;
    print("Casted value (doubled): ${castedValue * 2}");
  }
  
  
  // ============================================================
  // Problem 8: Understanding Different Constructor Styles (OOP Focus)
  // ============================================================
  
  print("\n=== Problem 8: Different Constructor Styles ===");
  
  // Create user using generative constructor
  User user1 = User("Huzaifa", 21, "student");
  
  // Create user using named constructor
  User user2 = User.guest();
  
  // Create user using factory constructor
  User user3 = User.fromJson({'name': 'Ali', 'age': 22, 'role': 'admin'});
  
  // Display all users
  user1.display();
  user2.display();
  user3.display();
}


// ============================================================
// Helper Functions and Classes
// ============================================================

// Function for Problem 4
List<int> processNumbers(List<int> numbers, bool Function(int) filterLogic) {
  List<int> result = [];
  
  for (int num in numbers) {
    if (filterLogic(num)) {
      result.add(num);
    }
  }
  
  return result;
}

bool isEven(int num) {
  return num % 2 == 0;
}

bool isGreaterThanFive(int num) {
  return num > 5;
}

// Car class for Problem 5 and 6
class Car {
  String model;
  String color;
  
  Car(this.model, this.color);
  
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(json['model'] as String, json['color'] as String);
  }
  
  void display() {
    print("$model - $color");
  }
}

// Function for Problem 6
List<Car> createCars(List<Map<String, dynamic>> jsonList) {
  List<Car> cars = [];
  
  for (Map<String, dynamic> json in jsonList) {
    cars.add(Car.fromJson(json));
  }
  
  return cars;
}

// User class for Problem 8
class User {
  String name;
  int age;
  String role;
  
  // 1. Generative Constructor
  User(this.name, this.age, this.role);
  
  // 2. Named Constructor - Guest User
  User.guest()
      : name = "Guest",
        age = 0,
        role = "guest";
  
  // 3. Factory Constructor - From JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'] as String,
      json['age'] as int,
      json['role'] as String,
    );
  }
  
  void display() {
    print("Name: $name, Age: $age, Role: $role");
  }
}