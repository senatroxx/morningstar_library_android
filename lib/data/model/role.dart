part of 'model.dart';

class Role extends Equatable {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const Role({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] as int?,
        name: json["name"] as String?,
        createdAt: json["created_at"] as String?,
        updatedAt: json["updated_at"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  Role copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        updatedAt,
      ];
}
