part of "model.dart";

class City extends Equatable {
  final int? id;
  final String? name;

  const City({
    this.id,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"] as int?,
      name: json["name"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  City copyWith({
    int? id,
    String? name,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
