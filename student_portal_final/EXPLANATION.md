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
11. Bottom navigation switches between Home, Students, API, Widgets, and Profile.
12. Students tab loads fake API data with `FutureBuilder`.
13. Map data becomes `Student` objects using `Student.fromJson`.
14. `ListView.builder` displays students.
15. API tab loads real internet data using `http.get`.
16. Widgets tab shows layout widgets like GridView, Row, Container, Stack, and Positioned.

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

### GridView

GridView makes boxes in rows and columns.

Think of it like a chocolate tray. Each chocolate has its own square.

In this app:

`lib/screens/widgets_gallery_screen.dart`

### Row

Row puts widgets side by side.

Column means top to bottom.
Row means left to right.

### Container

Container is a box. It can have width, height, color, padding, margin, and child.

In this app, colored boxes are Containers.

### Image.network

Image.network shows an image from the internet.

You give it a URL, and Flutter downloads and displays it.

### SingleChildScrollView

SingleChildScrollView lets one big child scroll.

Use it when your page is taller than the phone screen.

### Stack

Stack puts widgets on top of each other.

Think of putting stickers on a photo.

### Positioned

Positioned is used inside Stack.

It says exactly where a child should sit: top, right, bottom, or left.

In this app, a label is placed on top of an image with Positioned.

## Provider Concepts

### ChangeNotifier

ChangeNotifier is a class that can tell Flutter:

`My data changed. Please rebuild the widgets that are listening.`

In this app:

`lib/providers/counter_provider.dart`

### CounterProvider

CounterProvider stores the counter number.

It has:

- `_count`: private number
- `count`: getter so UI can read the number
- `increment()`: adds 1
- `decrement()`: subtracts 1
- `reset()`: goes back to 0
- `notifyListeners()`: tells listening widgets to rebuild

### ChangeNotifierProvider

ChangeNotifierProvider puts the provider into the widget tree.

In this app:

`lib/main.dart`

It wraps the app like this:

```dart
ChangeNotifierProvider(
  create: (context) => CounterProvider(),
  child: const StudentPortalApp(),
)
```

This means every screen can find `CounterProvider`.

### Consumer

Consumer listens to a provider and rebuilds when the provider changes.

In this app:

`lib/screens/home_screen.dart`

The Home screen uses:

```dart
Consumer<CounterProvider>(
  builder: (context, counterProvider, child) {
    return Text('Provider counter: ${counterProvider.count}');
  },
)
```

Like you are five:

- Provider is a toy box.
- CounterProvider keeps the toy count.
- ChangeNotifierProvider puts the toy box in the room.
- Consumer is the child watching the toy box.
- notifyListeners says, "Look, the toy count changed."

## Real HTTP API Concepts

### http package

The `http` package lets Flutter talk to websites and APIs.

In this app:

`lib/services/posts_api_service.dart`

### GET

GET means: "Please give me data."

This app gets posts from:

`https://jsonplaceholder.typicode.com/posts`

### POST

POST means: "Please create new data."

### PUT

PUT means: "Please update existing data."

### DELETE

DELETE means: "Please remove data."

### jsonDecode

APIs usually send text that looks like JSON.

`jsonDecode` changes that text into Dart lists/maps.

Then `Post.fromJson` changes each map into a `Post` object.

### API Screen

In this app:

`lib/screens/posts_screen.dart`

It has:

- `FutureBuilder` for GET
- button for GET
- button for POST
- button for PUT
- button for DELETE

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

## Exact Topic Map

- Provider: `lib/providers/counter_provider.dart`
- Consumer: `lib/screens/home_screen.dart`
- ChangeNotifierProvider: `lib/main.dart`
- Real HTTP API: `lib/services/posts_api_service.dart`
- API screen: `lib/screens/posts_screen.dart`
- GridView: `lib/screens/widgets_gallery_screen.dart`
- Row: `lib/screens/widgets_gallery_screen.dart`
- Container: `lib/screens/widgets_gallery_screen.dart`
- Image.network: `lib/screens/widgets_gallery_screen.dart`
- SingleChildScrollView: `lib/screens/widgets_gallery_screen.dart`
- Stack: `lib/screens/widgets_gallery_screen.dart`
- Positioned: `lib/screens/widgets_gallery_screen.dart`
