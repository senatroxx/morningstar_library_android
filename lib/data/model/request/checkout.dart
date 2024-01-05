part of 'request.dart';

class CheckoutRequest {
  int total;
  List<Book> books;
  int borrowDuration;
  int? userAddressId;
  String? courier;
  String? courierService;

  CheckoutRequest({
    required this.total,
    required this.books,
    required this.borrowDuration,
    this.userAddressId,
    this.courier,
    this.courierService,
  });

  factory CheckoutRequest.fromJsonToObject(Map<String, dynamic> data) {
    return CheckoutRequest(
      total: data['total'],
      books: (data['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      borrowDuration: data['borrow_duration'],
      userAddressId: data['user_address_id'],
      courier: data['courier'],
      courierService: data['courier_service'],
    );
  }

  Map<String, dynamic> fromObjectToJson() {
    return {
      'total': total,
      'books': books.map((e) => e.toJson()).toList(),
      'borrow_duration': borrowDuration,
      'user_address_id': userAddressId,
      'courier': courier,
      'courier_service': courierService,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CheckoutRequest].
  factory CheckoutRequest.fromJson(String data) {
    return CheckoutRequest.fromJsonToObject(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CheckoutRequest] to a JSON string.
  String toJson() => json.encode(fromObjectToJson());
}
