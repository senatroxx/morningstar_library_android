part of './layouts.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showAction;
  final bool showBottomNav;

  const MyScaffold({
    required this.child,
    this.title = "Morningstar",
    this.showAction = true,
    this.showBottomNav = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: DrawerMenu(),
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(
          title: title,
          showAction: showAction,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: child,
        ),
        bottomNavigationBar: showBottomNav ? const MyBottomNav() : null,
      ),
    );
  }
}
