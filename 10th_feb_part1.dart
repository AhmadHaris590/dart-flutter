void main() {
  var p1 = Person(name: "Ahsan", age: 22, weight: 56, isAsian: true);
  var p2 = Person(name: "Ahsan", age: 22, weight: 56, isAsian: true);
  // p1.age = 23; // can't set due to final
  // p1.function1(); // can't access due to static
  Person.function1();
  print(Person.noOfPersons);
  NetworkStatus status = NetworkStatus.online;
  print(status);

  buildSqlQuery(SqlOperator.and);

  List<int> myNumbers = [2, -1, 0, 5, 23, 47, 103, 8];
  // var newList = myNumbers.where((int n) {
  //   return n > 10;
  // });
  var newList = myNumbers.where((int n) => n > 10);
  print(newList.toList());
  var newList2 = myNumbers.map((n) => n.toString()).toList();
  // var newList2 = temp.toList();
  var a = myNumbers.map((n) {
    if (n > 10) {
      return n + 1;
    }
    return n;
  });
  print(a);

  // practice
  print("even no 'where': $evenNo");
  print("even no 'where' and .tolist: ${evenNo.toList()}");
  print("map : $greater10");
  print("map.tolist : ${greater10.toList()}");
  checkMobile(Mobile.iphone);
}

enum NetworkStatus {
  online,
  offline,
  connecting,
}

class Person {
  final String name;
  final int age;
  final double weight;
  final bool isAsian;

  Person({
    required this.name,
    required this.age,
    required this.weight,
    required this.isAsian,
  }) {
    noOfPersons++;
  }

  static int noOfPersons = 0;

  static function1() {}
}

enum SqlOperator {
  and,
  or,
}

buildSqlQuery(SqlOperator operator) {
  if (operator == SqlOperator.and) {
    // create sql with and
  } else if (operator == SqlOperator.or) {
    // create sql with or
  }
}

// int squareNumber(int number) {
//   return number * number;
// }

int squareNumber(int number) => number * number;

// ---------------PRACTICE--------------------
class Bike {
  String? company;
  int? model;

  Bike({required this.company, required this.model}) {
    noOfBikes++;
  }

  static var noOfBikes = 0;
}

List<int> number = [1, 2, 5, 6, 76, 53, 53, 4, 534, 5, 6, 7, 5, 23, 4, 23];
dynamic evenNo = number.where((n) => n % 2 == 0);

dynamic greater10 = number.map((num) {
  if (num > 10) {
    return num + 1;
  }
  return num;
});

enum Mobile { iphone, samsung }

checkMobile(Mobile mobile) {
  if (mobile == Mobile.iphone) {
    print("Appol user");
  }
  if (mobile == Mobile.samsung) {
    print("samssong user");
  }
}
