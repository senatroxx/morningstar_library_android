part of '../page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      child: Column(
        children: [
          CustomTextField(
            "Search",
            formName: "formName",
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
