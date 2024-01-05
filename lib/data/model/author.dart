part of 'model.dart';

class Author extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final Pagination<Book>? books;

  const Author({
    this.id,
    this.name,
    this.slug,
    this.books,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      books: json['books'] == null
          ? null
          : Pagination.fromJson(json['books'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'books': books,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        books,
      ];
}
