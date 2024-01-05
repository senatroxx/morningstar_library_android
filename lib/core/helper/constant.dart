// ignore_for_file: constant_identifier_names

part of 'helper.dart';

enum StatusDialog { INITIAL, LOAD, SUCCESS, FAILURE }

enum StatusWidget { INITIAL, LOAD, LOADMORE, SUCCESS, FAILURE }

enum RajaOngkirCourier { JNE, POS, TIKI }

class MorningstarAPI {
  static const String baseUrl = "http://localhost:8000/api/";

  // * AUTHENTICATION
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String logout = "auth/logout";
  static const String forgotVerifyEmail = "auth/forgot-password/send-otp";
  static const String forgotResetPassword = "auth/forgot-password/reset";

  // * HOME
  static const String home = "my";

  // * BOOK
  static const String books = "my/books";
  static const String booksDetail = "my/books/{slug}";

  // * CATEGORY
  static const String lend = "my/lends";
  static const String lendDetail = "my/lends/{id}";
  static const String lendReturn = "my/lends/{id}/return";
  static const String lendRecieved = "my/lends/{id}/recieved";
  static const String lendCancel = "my/lends/{id}/cancel";

  // * User Address
  static const String userAddress = "my/profile/addresses";
  static const String userAddressPrimary = "my/profile/addresses/primary";
}

class RajaOngkirAPI {
  static const String baseUrl = "https://api.rajaongkir.com/starter/";
  static const String key = "abac549984cfc75396b030f56edd5864";

  static const String province = "province";
  static const String city = "city";
  static const String cost = "cost";
}

class ConstList {
  static const List<String> statusInvoices = [
    "ALL",
    "PENDING",
    "PAID",
    "EXPIRED"
  ];

  static const List<String> statusLends = [
    "ALL",
    "PENDING",
    "PROCESSING",
    "SHIPPING",
    "ARRIVED",
    "RETURNING",
    "COMPLETE",
  ];
}
