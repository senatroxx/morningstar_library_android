import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/core/helper/helper.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final String route;

  const DrawerMenuItem(
    this.title, {
    super.key,
    required this.icon,
    required this.route,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: kSmallTextStyle.copyWith(
          color: color ?? kBlackColor,
        ),
      ),
      leading: Icon(icon, color: color ?? kBlackColor),
      // trailing: const Icon(Icons.arrow_forward_ios),
      // style: ListTileThemeData()
      tileColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      onTap: () {
        Modular.to.pushNamed(route);
      },
    );
  }
}
