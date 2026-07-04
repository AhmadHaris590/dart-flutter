import 'package:flutter/material.dart';
import 'package:student_portal_final/models/user_role.dart';
import 'package:student_portal_final/screens/home_screen.dart';
import 'package:student_portal_final/screens/posts_screen.dart';
import 'package:student_portal_final/screens/profile_screen.dart';
import 'package:student_portal_final/screens/students_screen.dart';
import 'package:student_portal_final/screens/widgets_gallery_screen.dart';

// StatefulWidget because selectedIndex changes when user taps bottom tabs.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String email =
        ModalRoute.of(context)!.settings.arguments as String? ??
            'student@test.com';

    final List<Widget> screens = [
      HomeScreen(email: email),
      const StudentsScreen(),
      const PostsScreen(),
      const WidgetsGalleryScreen(),
      ProfileScreen(email: email, role: UserRole.student),
    ];

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_download),
            label: 'API',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
