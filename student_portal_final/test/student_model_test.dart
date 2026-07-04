import 'package:flutter_test/flutter_test.dart';
import 'package:student_portal_final/models/student.dart';
import 'package:student_portal_final/utils/student_filters.dart';

void main() {
  test('Student.fromJson creates a student from map data', () {
    final student = Student.fromJson({
      'name': 'Ali',
      'marks': 82,
      'attendance': 90,
    });

    expect(student.name, 'Ali');
    expect(student.marks, 82);
    expect(student.attendance, 90);
  });

  test('grade returns A, B, C, or Fail from marks', () {
    expect(Student(name: 'A', marks: 80, attendance: 80).grade(), 'A');
    expect(Student(name: 'B', marks: 60, attendance: 80).grade(), 'B');
    expect(Student(name: 'C', marks: 40, attendance: 80).grade(), 'C');
    expect(Student(name: 'F', marks: 20, attendance: 80).grade(), 'Fail');
  });

  test('filterStudents keeps only students matching callback', () {
    final students = [
      Student(name: 'Ali', marks: 82, attendance: 90),
      Student(name: 'Sara', marks: 67, attendance: 70),
      Student(name: 'Zara', marks: 91, attendance: 88),
    ];

    final eligible = filterStudents(students, (student) => student.isEligible);

    expect(eligible.map((student) => student.name).toList(), ['Ali', 'Zara']);
  });
}
