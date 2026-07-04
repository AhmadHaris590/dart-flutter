void main() {
  Ahmad a1 = Ahmad();
  a1.eat();

  Cat cat1 = Cat(2.5, "hilius");
  print(cat1.name);
  print(cat1.age);
  cat1.eat();
  cat1.sleep();
}

// Encapsulation
class BankAccount {
  double _balance = 0;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  void withDraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    }
  }
}

// Abstraction
abstract class Payment {
  void pay(double amount);
}

class CreditCard implements Payment {
  @override
  void pay(double amount) {
    // logic for payment by Credit Card
  }
}

class EasyPaisa implements Payment {
  @override
  void pay(double amount) {
    // logic for payment by easypaisa
  }
}

class Car {
  consumeFuel() {
    // logic to consume fuel
  }
}

// Inheritence
class Honda extends Car {
  @override
  consumeFuel() {
    // logic to consumer fuel by Honda
  }
}

class Suzuki extends Car {
  @override
  consumeFuel() {
    // logic to consumer fuel by Suzuki;
  }
}

class Person {
  String name;

  Person(this.name);
}

class Student extends Person {
  String stdId;
  // Student(String stdName): super(stdName);
  Student(this.stdId, super.name);
}

// ------------------------PRACTICE----------------------
// abstraction
abstract class eating {
  void eat() {
    print("eating...");
  }
}

class Ahmad implements eating {
  void eat() {
    print("eating");
  }
}

// Inheritance
class Animal {
  String name;
  Animal(this.name);

  void eat() {
    print("eating");
  }

  void walk() {
    print("walking..");
  }

  void sleep() {
    print("sleeping..");
  }

  void hunt() {
    print("hunting..");
  }
}

class Cat extends Animal {
  String name;
  double age;

  Cat(this.age, this.name) : super(name);
}
