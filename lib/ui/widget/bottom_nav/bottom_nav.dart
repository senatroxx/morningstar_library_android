import 'package:flutter/material.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MyBottomNav extends StatefulWidget {
  final Function(int) callbackfunc;

  const MyBottomNav({
    required this.callbackfunc,
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

    widget.callbackfunc(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: TW3Colors.neutral.shade700,
      selectedItemColor: TW3Colors.blue.shade500,
      backgroundColor: kWhiteColor,
      elevation: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: "My Library",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: "My Library",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.workspace_premium,
            color: TW3Colors.yellow,
          ),
          label: "My Library",
        ),
      ],
    );
  }
}
