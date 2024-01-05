part of 'extension.dart';

extension IntExt on int {
  String numericToChar() {
    String char = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    List list = char.split("");
    return list[this];
  }

  String toRupiah() {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(this);
  }

  int numOfWeeks() {
    return (this / 7).ceil();
  }
}
