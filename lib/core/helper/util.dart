part of 'helper.dart';

void showLoad(BuildContext context) {
  if (!context.loaderOverlay.visible) {
    context.loaderOverlay.show();
  }
}

void hideLoad(BuildContext context) {
  if (context.loaderOverlay.visible) {
    context.loaderOverlay.hide();
  }
}

String placeholder(String path, Map<String, dynamic> replacements) {
  return path.replaceAllMapped(RegExp(r'\{([a-zA-Z0-9_]+)\}'), (Match m) {
    String key = m[1]!;
    return replacements.containsKey(key) ? replacements[key]! : m[0]!;
  });
}
