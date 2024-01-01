import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/core/helper/helper.dart';
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
    return AppBar(
      title: Text(
        title,
      ),
      leading: title != "Morningstar"
          ? IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: kBlackColor,
                size: 36,
              ),
              onPressed: () {
                Modular.to.maybePop();
              },
            )
          : null,
      automaticallyImplyLeading: false,
      actions: showAction
          ? [
              ElevatedButton(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Icon(Icons.search, color: kBlackColor),
                onPressed: () {
                  Modular.to.pushNamed(Routes.search);
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  visualDensity: VisualDensity.compact,
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(right: 20),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Badge.count(
                  count: 20,
                  child: Icon(Icons.shopping_cart_outlined, color: kBlackColor),
                ),
                onPressed: () {
                  Modular.to.pushNamed(Routes.cart);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed(Routes.profile);
                  // Scaffold.of(context).openDrawer();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(right: 20)),
                  visualDensity: VisualDensity.compact,
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
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
      backgroundColor: kWhiteColor,
      titleTextStyle: TextStyle(
        fontFamily: title == "Morningstar" ? "Mauline" : "Inter",
        fontSize: title == "Morningstar" ? 24 : 20,
        color: kBlackColor,
        fontWeight:
            title == "Morningstar" ? FontWeight.normal : FontWeight.w500,
      ),
      elevation: 0,
      // titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size(AppBar().preferredSize.width, AppBar().preferredSize.height);
}
