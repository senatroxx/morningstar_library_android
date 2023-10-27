import 'package:flutter/material.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:morningstar_library/routes/routes.dart';
import 'package:morningstar_library/ui/widget/drawer/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jane Doe", style: kHeadline4TextStyle),
                    Text("janedoe@gmail.com", style: kSubtitleTextStyle),
                  ],
                )
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerMenuItem(
                    "Home",
                    icon: Icons.home,
                    route: Routes.home,
                  ),
                  DrawerMenuItem(
                    "Profile",
                    icon: Icons.person,
                    route: Routes.profile,
                  ),
                  DrawerMenuItem(
                    "Search",
                    icon: Icons.search,
                    route: Routes.search,
                  ),
                  DrawerMenuItem(
                    "Saved Books",
                    icon: Icons.bookmark,
                    route: Routes.bookmark,
                  ),
                  Divider(),
                  DrawerMenuItem(
                    "Manage Books",
                    icon: Icons.book,
                    route: Routes.home,
                  ),
                  DrawerMenuItem(
                    "Manage Books",
                    icon: Icons.book,
                    route: Routes.home,
                  ),
                  DrawerMenuItem(
                    "Manage Books",
                    icon: Icons.book,
                    route: Routes.home,
                  ),
                  DrawerMenuItem(
                    "Manage Books",
                    icon: Icons.book,
                    route: Routes.home,
                  ),
                  DrawerMenuItem(
                    "Manage Books",
                    icon: Icons.book,
                    route: Routes.home,
                  ),
                  DrawerMenuItem(
                    "Manage Books",
                    icon: Icons.book,
                    route: Routes.home,
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          DrawerMenuItem(
            "Logout",
            icon: Icons.logout,
            color: kDangerColor,
            route: Routes.login,
          ),
        ],
      ),
    );
  }
}
