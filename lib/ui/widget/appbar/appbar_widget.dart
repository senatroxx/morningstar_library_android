import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/routes/routes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final bool showAction;

  const MyAppBar({
    Key? key,
    this.leading,
    this.title = "Morningstar",
    this.showAction = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: AppBar(
        title: Text(
          title,
        ),
        leading: leading,
        actions: showAction
            ? [
                ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed(Routes.profile);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ), // <-- Button color
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const CircleAvatar(
                    // radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ]
            : null,
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: title == "Morningstar" ? "Mauline" : "Inter",
          fontSize: title == "Morningstar" ? 24 : 20,
          fontWeight:
              title == "Morningstar" ? FontWeight.normal : FontWeight.w500,
        ),
        elevation: 0,
        titleSpacing: 0,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size(AppBar().preferredSize.width, AppBar().preferredSize.height);
}
