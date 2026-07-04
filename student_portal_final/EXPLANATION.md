# Student Portal Explanation

## App Flow

1. `main()` starts the app.
2. `runApp(const StudentPortalApp())` displays the root widget.
3. `StudentPortalApp` creates `MaterialApp`.
4. `MaterialApp` opens the `/` route first.
5. `/` shows `LoginScreen`.
6. User enters email and password.
7. `submitLogin()` validates input.
8. Fake login waits 1 second.
9. App navigates to `/dashboard` and passes email as an argument.
10. `DashboardScreen` reads email using `ModalRoute`.
11. Bottom navigation switches between Home, Students, and Profile.
12. Students tab loads fake API data with `FutureBuilder`.
13. Map data becomes `Student` objects using `Student.fromJson`.
14. `ListView.builder` displays students.

## Important Widgets

### MaterialApp

Wraps the full app. It gives routes, theme, navigation, and Material Design behavior.

### Scaffold

Creates a normal app page structure:

- `appBar`
- `body`
- `floatingActionButton`
- `bottomNavigationBar`

### AppBar

Top bar of the page.

### Column

Places widgets vertically.

### Padding

Adds space around a widget.

### SizedBox

Creates fixed empty space.

### TextField

Input box. It uses `TextEditingController` to read typed text.

### TextEditingController

Reads text from a `TextField` using `.text`.

### ElevatedButton

Clickable button.

### IconButton

Clickable icon.

### BottomNavigationBar

Bottom tabs. `currentIndex` is selected tab. `onTap` changes selected tab.

### FutureBuilder

Builds UI from async data.

It checks:

- waiting
- error
- no data
- success

### ListView.builder

Builds scrollable list rows from data.

### ListTile

Ready-made row with leading, title, subtitle, trailing.

## Important Dart Concepts

### Class

A blueprint for objects.

### Object

One real value created from a class.

### Constructor

Creates an object.

### Factory Constructor

Creates an object in a custom way, usually from map/API data.

### Getter

Used like a variable but calculates a value.

### Method

Function inside a class.

### enum

Fixed list of choices.

### Future

A value that comes later.

### async/await

Used to wait for a Future.

### callback

A function passed into another function.

## Memorize These Patterns

### setState

```dart
setState(() {
  counter++;
});
```

### FutureBuilder

```dart
FutureBuilder<List<Student>>(
  future: studentsFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }

    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    final students = snapshot.data!;
    return ListView.builder(...);
  },
)
```

### fromJson

```dart
factory Student.fromJson(Map<String, dynamic> json) {
  return Student(
    name: json['name'] as String,
    marks: json['marks'] as int,
    attendance: json['attendance'] as int,
  );
}
```

### Navigation With Argument

```dart
Navigator.pushReplacementNamed(
  context,
  '/dashboard',
  arguments: email,
);
```

### Read Argument

```dart
final email = ModalRoute.of(context)!.settings.arguments as String;
```
