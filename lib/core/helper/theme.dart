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
Color kWhiteBgColor = Color(TW3Colors.gray.shade100.value);
Color kBlackColor = Color(TW3Colors.neutral.shade700.value);
Color kSubtitleColor = Color(TW3Colors.neutral.shade500.value);
Color kBorderColor = Color(TW3Colors.neutral.shade300.value);
Color kDangerColor = Color(TW3Colors.red.shade500.value);
Color kSuccessColor = Color(TW3Colors.green.shade700.value);
Color kSuccessBgColor = Color(TW3Colors.green.shade300.value);
const Color kGreyColor = Color(0xFF9F9F9F);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kStarColor = Color(0xFFFFC700);
const Color kStrokeColor = Color(0xFFDBDBDB);

// TextStyle kBlackTextStyle = TextStyle(color: kBlackColor);
// TextStyle kSubtitleTextStyle = TextStyle(color: kSubtitleColor);
// TextStyle kSubtitleTextStyle2 = const TextStyle(color: kGreyColor);
// TextStyle kWhiteTextStyle = const TextStyle(color: kWhiteColor);
// TextStyle kWhiteBgTextStyle = const TextStyle(color: kWhiteBgColor);
// TextStyle kYellowTextStyle = const TextStyle(color: kStarColor);
// TextStyle kOrangeTextStyle = TextStyle(color: kPrimaryColor);

TextStyle kHeadline1TextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 36,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kHeadline2TextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 30,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kHeadline3TextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kHeadline4TextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kLargeTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: kBlackColor,
);

TextStyle kLargeSemiBoldTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kBaseTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: kBlackColor,
);

TextStyle kBaseSemiBoldTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kSmallTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: kBlackColor,
);

TextStyle kSmallSemiBoldTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
);

TextStyle kSubtitleTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: kSubtitleColor,
);

TextStyle kSubtitleSemiBoldTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: kSubtitleColor,
);

TextStyle kXSmallTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: kSubtitleColor,
);

TextStyle kXSmallSemiBoldTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: kSubtitleColor,
);

ThemeData myTheme() {
  return ThemeData(
    fontFamily: "Inter",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(secondary: kPrimaryColor),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      tileColor: Colors.white,
      textColor: kBlackColor,
      iconColor: kBlackColor,
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
