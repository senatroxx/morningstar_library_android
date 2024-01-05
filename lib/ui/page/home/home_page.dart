part of '../page.dart';

final List<String> imgList = [
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/300',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    context.read<HomeCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeDataLoaded) {
          if (state.statusWidget == StatusWidget.INITIAL) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.statusWidget == StatusWidget.FAILURE) {
            return Center(
              child: Text(state.err ?? ""),
            );
          }

          if (state.statusWidget == StatusWidget.LOAD) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.statusWidget == StatusWidget.SUCCESS) {
            return MyListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    aspectRatio: 1.1,
                    enlargeCenterPage: true,
                    viewportFraction: 0.65,
                    onPageChanged: (index, reason) => {
                      setState(() {
                        _carouselController.animateToPage(index);
                      })
                    },
                  ),
                  items: state.data!.randomBooks!
                      .map(
                        (item) => Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: ImageNetwork(
                              item.thumbnail!,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    aspectRatio: 1.4,
                  ),
                  disableGesture: true,
                  carouselController: _carouselController,
                  items: [
                    for (int i = 0; i < state.data!.randomBooks!.length; i++)
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        width: 10100,
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: state.data!.randomBooks![i].title!,
                                style: kHeadline4TextStyle,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              state.data!.randomBooks![i].description!,
                              overflow: TextOverflow.ellipsis,
                              style: kSubtitleTextStyle,
                              maxLines: 5,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            ButtonPrimary(
                                title: "View Book",
                                callbackfunc: () {
                                  Modular.to.pushNamed(
                                    "${Routes.bookDetail}${state.data!.randomBooks![i].slug}",
                                  );
                                })
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Text("New Release", style: kHeadline4TextStyle),
                const SizedBox(height: 10),
                bookCarousel(state.data!.recentBooks!),
                const SizedBox(height: 30),
                Text("Random Picks For You", style: kHeadline4TextStyle),
                const SizedBox(height: 10),
                bookCarousel(state.data!.randomBooks!),
                const SizedBox(height: 30),
                Text("Latest Novel", style: kHeadline4TextStyle),
                const SizedBox(height: 10),
                bookCarousel(state.data!.latestNovel!),
                const SizedBox(height: 30),
                Text("Latest Comic", style: kHeadline4TextStyle),
                const SizedBox(height: 10),
                bookCarousel(state.data!.latestComic!),
                const SizedBox(height: 30),
                Text("Latest Financial Books", style: kHeadline4TextStyle),
                const SizedBox(height: 10),
                bookCarousel(state.data!.latestFinancial!),
              ],
            );
          }
        }

        return Container();
      },
    );
  }

  SizedBox bookCarousel(List<Book> books) {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return BookCard(
            books[index],
            width: 180,
          );
        },
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(item, fit: BoxFit.cover, width: 1000),
        ),
      ),
    )
    .toList();
