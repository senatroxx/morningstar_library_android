part of 'model.dart';

class Address extends Equatable {
  final int? id;
  final String? streetAddress1;
  final String? streetAddress2;
  final String? phone;
  final String? postalCode;
  final bool? isPrimary;
  final Province? province;
  final City? city;

  const Address({
    this.id,
    this.streetAddress1,
    this.streetAddress2,
    this.phone,
    this.postalCode,
    this.isPrimary,
    this.province,
    this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"] as int?,
      streetAddress1: json["street_address_1"] as String?,
      streetAddress2: json["street_address_2"] as String?,
      phone: json["phone"] as String?,
      postalCode: json["postal_code"] as String?,
      isPrimary: json["is_primary"] as bool?,
      province: Province.fromJson(json["province"] as Map<String, dynamic>),
      city: City.fromJson(json["city"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "street_address_1": streetAddress1,
        "street_address_2": streetAddress2,
        "phone": phone,
        "postal_code": postalCode,
        "is_primary": isPrimary,
        "province": province?.toJson(),
        "city": city?.toJson(),
      };

  Address copyWith({
    int? id,
    String? streetAddress1,
    String? streetAddress2,
    String? phone,
    String? postalCode,
    bool? isPrimary,
    Province? province,
    City? city,
  }) {
    return Address(
      id: id ?? this.id,
      streetAddress1: streetAddress1 ?? this.streetAddress1,
      streetAddress2: streetAddress2 ?? this.streetAddress2,
      phone: phone ?? this.phone,
      postalCode: postalCode ?? this.postalCode,
      isPrimary: isPrimary ?? this.isPrimary,
      province: province ?? this.province,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      streetAddress1,
      streetAddress2,
      phone,
      postalCode,
      isPrimary,
      province,
      city,
    ];
  }
}
