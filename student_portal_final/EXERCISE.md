# Exercise App: Course Manager

After running Student Portal, build this app from memory.

## Goal

Create a Flutter app called `Course Manager` using the same concepts.

## Requirements

### 1. Login Screen

- Email `TextField`
- Password `TextField`
- Password show/hide toggle
- Validation:
  - email cannot be empty
  - password cannot be empty
  - password must be at least 4 characters
- Fake async login using `Future.delayed`
- Navigate to dashboard after login

### 2. Dashboard

- Bottom navigation with 3 tabs:
  - Home
  - Courses
  - Profile

### 3. Course Model

Create `Course` with:

```dart
final String title;
final String teacher;
final int creditHours;
final bool isCompleted;
```

Add:

- normal constructor
- `factory Course.fromJson(Map<String, dynamic> json)`

### 4. Course Service

Create:

```dart
Future<List<Course>> fetchCourses()
```

It should:

- wait 1 second
- create a `List<Map<String, dynamic>>`
- convert maps to `Course` objects using `Course.fromJson`

### 5. Courses Screen

Use `FutureBuilder`.

Show:

- loading spinner
- error message
- no data message
- `ListView.builder` for courses
- total courses
- completed courses count
- total credit hours

### 6. Home Screen

- Show welcome email
- Add a counter
- Increment counter using FAB and `setState`

### 7. Profile Screen

- Show email
- Use enum `UserRole.student`
- Add logout button

## Challenge Function

Write this callback function:

```dart
List<Course> filterCourses(
  List<Course> courses,
  bool Function(Course course) test,
) {
  final List<Course> result = [];

  for (final course in courses) {
    if (test(course)) {
      result.add(course);
    }
  }

  return result;
}
```

Use it to get completed courses.
