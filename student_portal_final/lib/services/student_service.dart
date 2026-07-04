import 'package:student_portal_final/models/student.dart';

// Service class: this is where API/data loading code lives.
// Here it is fake data so the app works without internet.
class StudentService {
  Future<List<Student>> fetchStudents() async {
    // Future.delayed simulates waiting for an API.
    await Future.delayed(const Duration(seconds: 1));

    final List<Map<String, dynamic>> data = [
      {'name': 'Ali', 'marks': 82, 'attendance': 90},
      {'name': 'Sara', 'marks': 67, 'attendance': 70},
      {'name': 'Ahmed', 'marks': 45, 'attendance': 80},
      {'name': 'Zara', 'marks': 91, 'attendance': 88},
      {'name': 'Bilal', 'marks': 30, 'attendance': 55},
    ];

    // map() converts each map into a Student object.
    return data.map((item) => Student.fromJson(item)).toList();
  }
}
