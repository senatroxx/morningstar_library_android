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
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.receipt),
          icon: Icon(Icons.receipt_outlined),
          label: "Invoice",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.workspace_premium_outlined,
            color: TW3Colors.yellow,
          ),
          activeIcon: Icon(
            Icons.workspace_premium,
            color: TW3Colors.yellow,
          ),
          label: "My Library",
        ),
      ],
    );
  }
}
