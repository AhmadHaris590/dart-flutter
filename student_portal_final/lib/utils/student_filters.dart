import 'package:student_portal_final/models/student.dart';

// This demonstrates a callback function.
// test is a function passed into this function.
List<Student> filterStudents(
  List<Student> students,
  bool Function(Student student) test,
) {
  final List<Student> result = [];

  for (final student in students) {
    if (test(student)) {
      result.add(student);
    }
  }

  return result;
}

int countFailedStudents(List<Student> students) {
  int failed = 0;

  for (final student in students) {
    if (student.grade() == 'Fail') {
      failed++;
    }
  }

  return failed;
}
