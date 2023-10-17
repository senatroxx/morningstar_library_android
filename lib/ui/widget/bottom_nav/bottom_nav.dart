import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({
    super.key,
  });

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: TW3Colors.neutral.shade700,
      selectedItemColor: TW3Colors.blue.shade500,
      elevation: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "My Library",
        ),
      ],
    );
  }
}
