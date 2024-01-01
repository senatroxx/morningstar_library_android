part of './layouts.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showAction;
  final Widget? bottomNavigationBar;
  final bool showAppBar;

  const MyScaffold({
    required this.child,
    this.title = "Morningstar",
    this.showAction = true,
    this.showAppBar = true,
    this.bottomNavigationBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = showAppBar ? 100 : 20;

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: bottomNavigationBar,
        appBar: showAppBar
            ? MyAppBar(
                title: title,
                showAction: showAction,
              )
            : null,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(
              color: kWhiteBgColor,
            ),
            padding: EdgeInsets.fromLTRB(20, topPadding, 20, 0),
            child: child,
          ),
        ),
      ),
    );
  }
}
