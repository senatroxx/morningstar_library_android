part of 'model.dart';

class User extends Equatable {
  final int? id;
  final String? email;
  final String? name;
  final String? phone;
  final int? balance;
  final Role? role;
  final Membership? membership;
  final Address? primaryAddress;
  final String? createdAt;
  final String? updatedAt;

  const User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.balance,
    this.role,
    this.membership,
    this.primaryAddress,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      balance: json['balance'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      membership: json['membership'] == null
          ? null
          : Membership.fromJson(json['membership'] as Map<String, dynamic>),
      primaryAddress: json['primary_address'] == null
          ? null
          : Address.fromJson(json['primary_address'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'balance': balance,
      'role': role?.toJson(),
      'membership': membership?.toJson(),
      'primary_address': primaryAddress?.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      email,
      name,
      phone,
      balance,
      role,
      membership,
      primaryAddress,
      createdAt,
      updatedAt,
    ];
  }
}
