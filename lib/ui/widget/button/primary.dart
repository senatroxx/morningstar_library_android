part of 'button.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback? callbackfunc;
  const ButtonPrimary(
      {Key? key, required this.title, required this.callbackfunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: callbackfunc,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        child: Text(title),
      ),
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
