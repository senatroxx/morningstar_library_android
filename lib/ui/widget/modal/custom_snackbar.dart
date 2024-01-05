part of 'modal.dart';

class CustomSnackBar {
  BuildContext context;
  CustomSnackBar(this.context);

  void showSnackbar(String? v) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(v ?? "-"),
        action: SnackBarAction(
            label: "Dismiss", textColor: kPrimaryColor, onPressed: () {}),
      ),
    );
  }
}
