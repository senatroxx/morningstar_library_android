part of '../page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  int currentPageIndex = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      'image': 'assets/images/slide_1.png',
      'title': 'Morningstar Library',
      'heading': 'Find your book collection',
      'subHeading':
          'Embark on an extraordinary journey through the enchanting literary universe of Morningstar Library. Discover hidden gems, classics, and the latest releases.',
    },
    {
      'image': 'assets/images/slide_2.png',
      'title': 'Morningstar Library',
      'heading': 'Find more recent information',
      'subHeading':
          'Dive into an unparalleled world of literature where endless possibilities await. Explore diverse genres, cultures, and perspectives.',
    },
    {
      'image': 'assets/images/slide_3.png',
      'title': 'Morningstar Library',
      'heading': 'Easy access anywhere anytime',
      'subHeading':
          'Indulge in the joy of reading as you immerse yourself in the captivating world of literature. Our library is a haven for those seeking moments of escape, inspiration, and reflection.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    String title = onboardingData[currentPageIndex]['title'] ?? '';
    String heading = onboardingData[currentPageIndex]['heading'] ?? '';
    String subHeading = onboardingData[currentPageIndex]['subHeading'] ?? '';

    return MyScaffold(
      showAppBar: false,
      backgroundColor: const Color(0xFF6366F1),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image(
                image:
                    AssetImage(onboardingData[currentPageIndex]['image'] ?? ''),
                width: 400,
              ),
              const SizedBox(height: 10),
              Text(
                heading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subHeading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentPageIndex < onboardingData.length - 1) {
                    currentPageIndex++;
                  } else {
                    Modular.to.pushNamed(Routes.login);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
              ),
              child: const Text(
                "Next ->",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
