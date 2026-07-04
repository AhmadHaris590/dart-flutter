// enum means fixed choices only.
// This avoids typo-prone strings like "studnt" or "teacherr".
enum UserRole {
  student,
  teacher,
  admin,
}

String roleLabel(UserRole role) {
  if (role == UserRole.student) {
    return 'Student';
  } else if (role == UserRole.teacher) {
    return 'Teacher';
  } else {
    return 'Admin';
  }
}
