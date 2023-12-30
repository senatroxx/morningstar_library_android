part of './layouts.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showAction;
  final bool showAppBar;

  const MyScaffold({
    required this.child,
    this.title = "Morningstar",
    this.showAction = true,
    this.showAppBar = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = showAppBar ? 100 : 20;

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: showAppBar
            ? MyAppBar(
                title: title,
                showAction: showAction,
              )
            : null,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteBgColor,
          ),
          padding: EdgeInsets.fromLTRB(20, topPadding, 20, 0),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
    );
  }
}
