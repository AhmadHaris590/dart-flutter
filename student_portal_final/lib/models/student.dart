// A model class stores related data in one object.
// This is cleaner than separate lists for name, marks, and attendance.
class Student {
  final String name;
  final int marks;
  final int attendance;

  // Normal constructor with named required parameters.
  Student({
    required this.name,
    required this.marks,
    required this.attendance,
  });

  // Factory constructor creates a Student from Map/JSON-style data.
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] as String,
      marks: json['marks'] as int,
      attendance: json['attendance'] as int,
    );
  }

  // Getter: used like a variable, but calculates the answer.
  bool get isEligible {
    return marks >= 60 && attendance >= 75;
  }

  // Method: function inside a class.
  String grade() {
    if (marks >= 80) {
      return 'A';
    } else if (marks >= 60) {
      return 'B';
    } else if (marks >= 40) {
      return 'C';
    } else {
      return 'Fail';
    }
  }
}
