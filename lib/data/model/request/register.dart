part of 'request.dart';

class RequestRegister {
  String name;
  String email;
  String phone;
  String password;
  String passwordConfirmation;

  RequestRegister({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RequestRegister.fromJsonToObject(Map<String, dynamic> data) {
    return RequestRegister(
      email: data['email'],
      name: data['name'],
      phone: data['phone'],
      password: data['password'],
      passwordConfirmation: data['password_confirmation'],
    );
  }

  Map<String, dynamic> fromObjectToJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RequestRegister].
  factory RequestRegister.fromJson(String data) {
    return RequestRegister.fromJsonToObject(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RequestRegister] to a JSON string.
  String toJson() => json.encode(fromObjectToJson());
}
