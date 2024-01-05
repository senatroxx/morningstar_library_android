part of 'extension.dart';

extension StringExt on String {
  String abbreviation() {
    if (length < 4) return this;

    List<String> lst = split("");
    var chunks = [];
    int chunkSize = 2;
    for (var i = 0; i < lst.length; i += chunkSize) {
      chunks.add(lst.sublist(
          i, i + chunkSize > lst.length ? lst.length : i + chunkSize));
    }

    String text = "";
    for (int i = 0; i < chunks.length; i++) {
      List chunk = chunks[i];
      text += chunk.first;
      if (i == chunks.length - 1 && chunk.length > 1) {
        text += chunk.last;
      }
    }

    return text.toUpperCase();
  }

  String formatHmFromHms() {
    return DateFormat("HH:mm").format(DateFormat("H:m:s").parse(this));
  }

  String currencyFormat() {
    return NumberFormat("#,##", "id_ID").format(this);
  }

  String replace62() {
    return (split("").first == "0") ? "+62${substring(1)}" : "+62$this";
  }

  String? statusInvoice() {
    String? _status;
    switch (this) {
      case "Bayar":
        _status = "PAID";
        break;
      case "Belum Bayar":
        _status = "UNPAID";
        break;
      case "Expired":
        _status = "EXPIRED";
        break;
      case "DONE":
        _status = "DONE";
        break;
      default:
        _status = null;
    }

    return _status;
  }
}
