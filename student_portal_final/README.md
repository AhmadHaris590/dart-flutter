# Student Portal Final App

This is a runnable Flutter app for exam practice. It uses the concepts from the class repo:

- variables
- lists and maps
- loops
- if/else
- functions
- callback functions
- classes and objects
- constructors
- factory constructors
- enums
- null safety
- async/await
- Future
- FutureBuilder
- Provider
- Consumer
- ChangeNotifierProvider
- ChangeNotifier
- real HTTP API calls with `http`
- GET, POST, PUT, DELETE
- Scaffold, AppBar, Column, TextField, ListView, ListTile
- GridView
- Row
- Container
- Image.network
- SingleChildScrollView
- Stack
- Positioned
- StatefulWidget
- setState
- navigation
- form validation

## How to run

Open a terminal in this folder:

```bash
cd student_portal_final
flutter pub get
flutter run
```

## How to test

```bash
flutter test
```

## Files to read first

1. `lib/models/student.dart`
2. `lib/services/student_service.dart`
3. `lib/utils/student_filters.dart`
4. `lib/providers/counter_provider.dart`
5. `lib/services/posts_api_service.dart`
6. `lib/models/post.dart`
7. `lib/screens/login_screen.dart`
8. `lib/screens/dashboard_screen.dart`
9. `lib/screens/home_screen.dart`
10. `lib/screens/students_screen.dart`
11. `lib/screens/posts_screen.dart`
12. `lib/screens/widgets_gallery_screen.dart`
13. `lib/screens/profile_screen.dart`
14. `EXERCISE.md`
15. `EXPLANATION.md`

## Where the important topics live

- Provider / ChangeNotifier: `lib/providers/counter_provider.dart`
- ChangeNotifierProvider: `lib/main.dart`
- Consumer: `lib/screens/home_screen.dart`
- Real HTTP API: `lib/services/posts_api_service.dart`
- API UI screen: `lib/screens/posts_screen.dart`
- GridView / Row / Container / Image.network / SingleChildScrollView / Stack / Positioned: `lib/screens/widgets_gallery_screen.dart`
