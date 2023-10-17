part of 'helper.dart';

const double defaultSpace = 16;

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

Color kPrimaryColor = Color(TW3Colors.blue.shade500.value);
const Color kWhiteBgColor = Color(0xFFF6F9FF);
Color kBlackColor = Color(TW3Colors.neutral.shade700.value);
Color kSubtitleColor = Color(TW3Colors.neutral.shade500.value);
const Color kGreyColor = Color(0xFF9F9F9F);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kStarColor = Color(0xFFFFC700);
const Color kStrokeColor = Color(0xFFDBDBDB);

TextStyle kBlackTextStyle = TextStyle(color: kBlackColor);
TextStyle kSubtitleTextStyle = TextStyle(color: kSubtitleColor);
TextStyle kSubtitleTextStyle2 = const TextStyle(color: kGreyColor);
TextStyle kWhiteTextStyle = const TextStyle(color: kWhiteColor);
TextStyle kWhiteBgTextStyle = const TextStyle(color: kWhiteBgColor);
TextStyle kYellowTextStyle = const TextStyle(color: kStarColor);
TextStyle kOrangeTextStyle = TextStyle(color: kPrimaryColor);

ThemeData myTheme() {
  return ThemeData(
    fontFamily: "Inter",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(secondary: kPrimaryColor),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      tileColor: Colors.white,
      textColor: TW3Colors.neutral.shade700,
      iconColor: TW3Colors.neutral.shade700,
      titleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: TW3Colors.neutral.shade200,
          width: 1.5,
        ),
      ),
    ),
  );
}
