import 'package:flutter/material.dart';
import 'package:student_portal_final/models/student.dart';
import 'package:student_portal_final/services/student_service.dart';
import 'package:student_portal_final/utils/student_filters.dart';

// StatefulWidget because it stores the Future created in initState.
class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  late Future<List<Student>> studentsFuture;

  @override
  void initState() {
    super.initState();
    studentsFuture = StudentService().fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: FutureBuilder<List<Student>>(
        future: studentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No students found'));
          }

          final List<Student> students = snapshot.data!;
          final List<Student> eligibleStudents = filterStudents(
            students,
            (student) => student.isEligible,
          );
          final int failedCount = countFailedStudents(students);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Total: ${students.length} | Eligible: ${eligibleStudents.length} | Failed: $failedCount',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final Student student = students[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(student.name[0]),
                      ),
                      title: Text(student.name),
                      subtitle: Text(
                        'Marks: ${student.marks}, Attendance: ${student.attendance}%, Grade: ${student.grade()}',
                      ),
                      trailing: Icon(
                        student.isEligible ? Icons.check_circle : Icons.cancel,
                        color: student.isEligible ? Colors.green : Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
