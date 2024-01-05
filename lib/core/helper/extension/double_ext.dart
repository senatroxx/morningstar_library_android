part of 'extension.dart';

extension DoubleExt on double {
  String currencyFormat() {
    return NumberFormat("#,###", "id_ID").format(this);
  }
}
