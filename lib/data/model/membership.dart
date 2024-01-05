part of 'model.dart';

class Membership extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final int? balance;
  final int? price;
  final int? discountPrice;
  final int? maxBorrowCount;
  final int? maxBorrowWeeks;
  final int? finePerWeeks;
  final String? createdAt;
  final String? updatedAt;

  const Membership({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.balance,
    this.price,
    this.discountPrice,
    this.maxBorrowCount,
    this.maxBorrowWeeks,
    this.finePerWeeks,
    this.createdAt,
    this.updatedAt,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    log("Membership Model: ${json.toString()}");
    return Membership(
      id: json["id"] as int?,
      name: json["name"] as String?,
      slug: json["slug"] as String?,
      description: json["description"] as String?,
      balance: json["balance"] as int?,
      price: json["price"] as int?,
      discountPrice: json["discount_price"] as int?,
      maxBorrowCount: json["max_borrow_count"] as int?,
      maxBorrowWeeks: json["max_borrow_weeks"] as int?,
      finePerWeeks: json["fine_per_weeks"] as int?,
      createdAt: json["created_at"] as String?,
      updatedAt: json["updated_at"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "balance": balance,
        "price": price,
        "discount_price": discountPrice,
        "max_borrow_count": maxBorrowCount,
        "max_borrow_weeks": maxBorrowWeeks,
        "fine_per_weeks": finePerWeeks,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        balance,
        price,
        discountPrice,
        maxBorrowCount,
        maxBorrowWeeks,
        finePerWeeks,
        createdAt,
        updatedAt,
      ];
}
