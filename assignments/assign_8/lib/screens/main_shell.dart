import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/ubit_app_bar_actions.dart';
import '../widgets/ubit_bottom_nav_bar.dart';
import '../widgets/ubit_drawer.dart';
import 'home_screen.dart';
import 'market_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  static const _title = 'UBIT Hub';

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(_title),
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        if (_currentIndex == 0) ...[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: InitialsAvatar(initials: 'JD'),
          ),
        ] else if (_currentIndex == 1) ...[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
          const SizedBox(width: 4),
        ] else ...[
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: ProfilePhotoAvatar(),
          ),
        ],
      ],
    );
  }

  Widget? _buildFab() {
    if (_currentIndex == 0) {
      return FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      );
    }
    if (_currentIndex == 1) {
      return FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {},
        icon: const Icon(Icons.add_rounded),
        label: const Text('Sell Item'),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      drawer: const UbitDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          MarketplaceScreen(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: UbitBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}