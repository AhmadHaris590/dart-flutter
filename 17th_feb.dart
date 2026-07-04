main() {
  String x = "hello@gmail.com";
  print(x.isValidEmail());
  int a = 4;
  print(a.isMultipleOf5());
  print(a.isEvenn());

  Animal a1 = Animal();
  a1.name = "cat";
  print(a1.name);

  Cat cat1 = Cat("hilius", "2");
  print("Cat Name :${cat1.name}, Age: ${cat1.age}");
  cat1.swim();
}

// Extension - is a way to add new functionality to existing classes without modifying the original class. It allows you to add new methods, properties, or operators to a class without changing its source code.
extension on int {
  bool isMultipleOf5() {
    return this % 5 == 0;
  }
}

extension ValidationExtension on String {
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-z0-9._%+-]+@[a-zA-z0,-]+\.[a-zA-z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }
}

// MIXIN - is a way to reuse a class's code in multiple class hierarchies. It allows you to add functionality to classes without using inheritance.
mixin fly {
  // logic to fly
}

class Bird with fly {}

class Airplane with fly {}

// Multiple Inheritence - is a feature of some object-oriented programming languages in which a class can inherit properties and behaviors from more than one parent class. This allows for greater flexibility and code reuse, but can also lead to ambiguity if multiple parent classes have methods with the same name.

class Bike {}

class Boat {}

class Dhoom3Bike implements Bike, Boat {}

// --------------------PRACTICE-------------------
extension on int {
  bool isEvenn() {
    return this % 2 == 0;
  }
}

mixin canSwim {
  void swim() {
    print("swiming");
  }
}

class Animal {
  String? name;

  void sleep() {
    print("sleeping");
  }

  void eat() {
    print("eating");
  }
}

class Cat extends Animal with canSwim {
  String? age;
  Cat(name, age) {
    super.name = name;
    this.age = age;
  }
}
