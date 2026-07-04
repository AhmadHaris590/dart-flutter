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

### 8. Provider Counter

Create `CourseCounterProvider`.

It should:

- extend `ChangeNotifier`
- have private `_count`
- have getter `count`
- have `increment()`
- have `reset()`
- call `notifyListeners()` after changing data

Wrap your app with:

```dart
ChangeNotifierProvider(
  create: (context) => CourseCounterProvider(),
  child: const CourseManagerApp(),
)
```

Use `Consumer<CourseCounterProvider>` on the Home screen.

### 9. Real API Screen

Create a `PostsScreen` or `ApiScreen`.

It should:

- use the `http` package
- call `https://jsonplaceholder.typicode.com/posts`
- use `http.get`
- use `jsonDecode`
- convert JSON maps into model objects
- show data with `FutureBuilder`
- show posts with `ListView.builder`

Bonus:

- add `POST`
- add `PUT`
- add `DELETE`

### 10. Widget Practice Screen

Create a `WidgetsPracticeScreen`.

It must include:

- `GridView`
- `Row`
- `Container`
- `Image.network`
- `SingleChildScrollView`
- `Stack`
- `Positioned`

Simple idea:

- top section: `Row` with 3 colored `Container`s
- middle section: `Stack` with `Image.network` and `Positioned` label
- bottom section: `GridView.count` with colored boxes

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

## Super Important

When you finish, you should have these tabs:

1. Home
2. Courses
3. API
4. Widgets
5. Profile
