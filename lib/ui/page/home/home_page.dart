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
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            items: imageSliders,
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
              Container(
                margin: const EdgeInsets.all(5.0),
                width: 1000,
                child: Column(
                  children: [
                    Text(
                      'The Tell Tale Heart And Other Stories',
                      style: kHeadline4TextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'True!—nervous—very, very dreadfully nervous I had been and am; but why will you say that I am mad? The disease had sharpened my senses—not destroyed—not dulled them. Above all was the sense of hearing acute.',
                      style: kSubtitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ButtonPrimary(title: "View Book", callbackfunc: () {})
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text("New Release", style: kHeadline4TextStyle),
          const SizedBox(height: 10),
          SizedBox(
            height: 330,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  width: 180,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 240,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://picsum.photos/200/300",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "The Tell Tale Heart And Other Stories",
                        style: kSubtitleTextStyle,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text("Popular", style: kHeadline4TextStyle),
          const SizedBox(height: 10),
          SizedBox(
            height: 330,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  width: 180,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 240,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://picsum.photos/200/300",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "The Tell Tale Heart And Other Stories",
                        style: kSubtitleTextStyle,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
