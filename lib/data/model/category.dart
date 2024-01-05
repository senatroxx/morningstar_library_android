part of 'model.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final Pagination<Book>? books;
  final String? createdAt;
  final String? updatedAt;

  const Category({
    this.id,
    this.name,
    this.slug,
    this.books,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] == null ? null : json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      books: json['books'] == null
          ? null
          : Pagination.fromJson(json['books'] as Map<String, dynamic>),
      createdAt:
          json['created_at'] == null ? null : json['created_at'] as String,
      updatedAt:
          json['updated_at'] == null ? null : json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'books': books,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props => [id, name, slug, books, createdAt, updatedAt];
}
