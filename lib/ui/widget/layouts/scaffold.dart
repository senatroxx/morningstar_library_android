part of './layouts.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showAction;
  final bool showBottomNav;
  final bool showAppBar;

  const MyScaffold({
    required this.child,
    this.title = "Morningstar",
    this.showAction = true,
    this.showBottomNav = true,
    this.showAppBar = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = showAppBar ? 100 : 20;

    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: const DrawerMenu(),
        extendBodyBehindAppBar: true,
        appBar: showAppBar
            ? MyAppBar(
                title: title,
                showAction: showAction,
              )
            : null,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          padding: EdgeInsets.fromLTRB(20, topPadding, 20, 0),
          child: child,
        ),
        bottomNavigationBar: showBottomNav ? const MyBottomNav() : null,
      ),
    );
  }
}
