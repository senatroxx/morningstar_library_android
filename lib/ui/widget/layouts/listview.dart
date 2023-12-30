part of "layouts.dart";

class MyListView extends StatelessWidget {
  final List<Widget> children;
  const MyListView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      children: children,
    );
  }
}
