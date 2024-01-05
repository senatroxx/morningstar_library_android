part of 'extension.dart';

extension DateTimeExt on DateTime {
  String dMMMyyyy() => DateFormat("d MMM yyyy").format(toLocal());

  String dMMMMyyyy() => DateFormat("d MMMM yyyy", "id_ID").format(toLocal());

  String yyyyMMdd() => DateFormat("yyyy-MM-dd").format(toLocal());

  String ddMMyy() => DateFormat("dd-MM-yy").format(toLocal());

  String dMMMMyyyyHHmm() =>
      DateFormat("d MMMM yyyy HH:mm WIB", "id_ID").format(toLocal());

  String edMMMMyyyy() =>
      DateFormat("EEEE, d MMMM yyyy", "id_ID").format(toLocal());
}
