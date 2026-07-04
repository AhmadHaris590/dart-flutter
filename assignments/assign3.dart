void main() {
  // ======================================
  // Problem 1: Student Eligibility System
  // ======================================

  List<Map<String, dynamic>> students = [
    {'name': 'Ali', 'attendance': 85, 'marks': 70},
    {'name': 'Sara', 'attendance': 60, 'marks': 75},
    {'name': 'Ahmed', 'attendance': 90, 'marks': 55},
    {'name': 'Zara', 'attendance': 78, 'marks': 82},
  ];

  int eligibleCount = 0;

  for (var student in students) {
    if (student['attendance'] >= 75 && student['marks'] >= 60) {
      print("${student['name']} → Eligible");
      eligibleCount++;
    } else {
      print("${student['name']} → Not Eligible");
    }
  }

  print("Total Eligible Students = $eligibleCount\n");

  // ==================================
  // Problem 2: Employee Salary Filter
  // ==================================

  List<Map<String, dynamic>> employees = [
    {'name': 'Usman', 'department': 'IT', 'salary': 60000},
    {'name': 'Hina', 'department': 'HR', 'salary': 45000},
    {'name': 'Bilal', 'department': 'IT', 'salary': 52000},
    {'name': 'Ayesha', 'department': 'Finance', 'salary': 48000},
  ];

  int itCount = 0;
  List<String> highSalaryEmployees = [];

  for (var emp in employees) {
    if (emp['salary'] > 50000) {
      highSalaryEmployees.add(emp['name']);
    }
    if (emp['department'] == 'IT') {
      itCount++;
    }
  }

  print("Employees with salary > 50,000: ${highSalaryEmployees.join(', ')}");
  print("Total IT Employees = $itCount\n");

  // =================================
  // Problem 3: Product Stock Checker
  // =================================

  List<Map<String, dynamic>> products = [
    {'product': 'Laptop', 'stock': 5},
    {'product': 'Mouse', 'stock': 0},
    {'product': 'Keyboard', 'stock': 12},
    {'product': 'Monitor', 'stock': 0},
  ];

  int availableProducts = 0;

  for (var item in products) {
    if (item['stock'] > 0) {
      print("${item['product']} → In Stock");
      availableProducts++;
    } else {
      print("${item['product']} → Out of Stock");
    }
  }

  print("Total Available Products = $availableProducts\n");

  // ==================================
  // Problem 4: Exam Result Processing
  // ==================================

  List<Map<String, dynamic>> results = [
    {'name': 'Ali', 'marks': 82},
    {'name': 'Sara', 'marks': 67},
    {'name': 'Ahmed', 'marks': 45},
    {'name': 'Zara', 'marks': 30},
  ];

  int failedCount = 0;

  for (var student in results) {
    String grade;

    if (student['marks'] >= 80) {
      grade = 'A';
    } else if (student['marks'] >= 60) {
      grade = 'B';
    } else if (student['marks'] >= 40) {
      grade = 'C';
    } else {
      grade = 'Fail';
      failedCount++;
    }

    print("${student['name']} → $grade");
  }

  print("Total Failed Students = $failedCount\n");

  // ================================
  // Problem 5: Shopping Cart Total
  // ================================

  List<Map<String, dynamic>> cart = [
    {'item': 'Shirt', 'price': 2500, 'quantity': 2},
    {'item': 'Shoes', 'price': 5000, 'quantity': 1},
    {'item': 'Cap', 'price': 800, 'quantity': 3},
  ];

  int cartTotal = 0;

  for (var item in cart) {
    int totalPrice = item['price'] * item['quantity'];
    cartTotal += totalPrice;
    print("${item['item']} Total = $totalPrice");
  }

  print("Cart Total = $cartTotal");

  if (cartTotal > 10000) {
    print("Discount Applied");
    double finalAmount = cartTotal * 0.9;
    print("Final Amount = ${finalAmount.toInt()}\n");
  }

  // ===========================================
  // Problem 6: Active User System (While Loop)
  // ===========================================

  List<Map<String, dynamic>> users = [
    {'name': 'Ali', 'isActive': true},
    {'name': 'Sara', 'isActive': false},
    {'name': 'Ahmed', 'isActive': true},
    {'name': 'Zara', 'isActive': false},
  ];

  int i = 0;
  int inactiveCount = 0;
  List<String> activeUsers = [];

  while (i < users.length) {
    if (users[i]['isActive'] == true) {
      activeUsers.add(users[i]['name']);
    } else {
      inactiveCount++;
    }
    i++;
  }

  print("Active Users: ${activeUsers.join(', ')}");
  print("Total Inactive Users = $inactiveCount\n");

  // ================================
  // Problem 7: Attendance Summary
  // ================================

  List<Map<String, dynamic>> attendance = [
    {'name': 'Ali', 'attendance': 82},
    {'name': 'Sara', 'attendance': 48},
    {'name': 'Ahmed', 'attendance': 65},
    {'name': 'Zara', 'attendance': 35},
  ];

  List<String> lowAttendance = [];
  int highAttendanceCount = 0;

  for (var student in attendance) {
    if (student['attendance'] < 50) {
      lowAttendance.add(student['name']);
    }
    if (student['attendance'] >= 75) {
      highAttendanceCount++;
    }
  }

  print("Low Attendance: ${lowAttendance.join(', ')}");
  print("Students with Attendance ≥ 75 = $highAttendanceCount\n");

  // =====================================
  // Problem 8: Library Book Availability
  // =====================================

  List<Map<String, dynamic>> books = [
    {'title': 'Flutter Basics', 'copies': 3},
    {'title': 'Dart Advanced', 'copies': 0},
    {'title': 'Clean Code', 'copies': 5},
    {'title': 'OOP Concepts', 'copies': 0},
  ];

  List<String> availableBooks = [];
  int unavailableBooks = 0;

  for (var book in books) {
    if (book['copies'] > 0) {
      availableBooks.add(book['title']);
    } else {
      unavailableBooks++;
    }
  }

  print("Available Books: ${availableBooks.join(', ')}");
  print("Unavailable Books = $unavailableBooks");
}
