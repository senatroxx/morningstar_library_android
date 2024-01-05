part of "model.dart";

class Province extends Equatable {
  final int? id;
  final String? name;

  const Province({
    this.id,
    this.name,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json["id"] as int?,
      name: json["name"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Province copyWith({
    int? id,
    String? name,
  }) {
    return Province(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
