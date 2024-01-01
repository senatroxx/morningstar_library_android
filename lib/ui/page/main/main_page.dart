part of "../page.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: MyBottomNav(
          callbackfunc: _onItemTapped,
        ),
        backgroundColor: kWhiteBgColor,
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomePage(),
            BookFavoritePage(),
            InvoicePage(),
          ],
        ),
      ),
    );
  }
}
