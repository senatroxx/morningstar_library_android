part of 'button.dart';

class ButtonPrimarySize {
  final double x;
  final double y;

  const ButtonPrimarySize({required this.x, required this.y});

  static const ButtonPrimarySize small = ButtonPrimarySize(x: 12, y: 6);
  static const ButtonPrimarySize medium = ButtonPrimarySize(x: 16, y: 10);
  static const ButtonPrimarySize large = ButtonPrimarySize(x: 16, y: 16);
}

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback? callbackfunc;
  final ButtonPrimarySize size;
  final bool fullWidth;

  const ButtonPrimary({
    Key? key,
    required this.title,
    required this.callbackfunc,
    this.size = ButtonPrimarySize.medium,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callbackfunc,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: size.x, vertical: size.y),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: kPrimaryColor,
      ).merge(
        ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(
            Size(fullWidth ? double.infinity : 0, 0),
          ),
        ),
      ),
      child: Text(title, style: kBaseTextStyle.copyWith(color: kWhiteColor)),
    );
  }
}

class ButtonPrimaryIcon extends StatelessWidget {
  final String title;
  final Function() callbackfunc;
  final Widget icon;
  const ButtonPrimaryIcon(
      {Key? key,
      required this.title,
      required this.callbackfunc,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: callbackfunc,
        icon: icon,
        label: Text(title),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
      ),
      // child: ElevatedButton(
      //   onPressed: callbackfunc,
      //   child: Text(title),
      //   style: ElevatedButton.styleFrom(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     primary: kPrimaryColor,
      //     elevation: 0,
      //   ),
      // ),
    );
  }
}
