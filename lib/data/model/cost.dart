part of 'model.dart';

class Cost extends Equatable {
  final String? service;
  final String? description;
  final int? price;
  final String? etd;

  const Cost({
    this.service,
    this.description,
    this.price,
    this.etd,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      service: json['service'] as String?,
      description: json['description'] as String?,
      price: json["cost"][0]['value'] as int?,
      etd: json["cost"][0]['etd'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'description': description,
      'price': price,
      'etd': etd,
    };
  }

  @override
  List<Object?> get props => [
        service,
        description,
        price,
        etd,
      ];
}
