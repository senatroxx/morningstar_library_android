part of 'model.dart';

class Book extends Equatable {
  // final object
  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? thumbnail;
  final String? publishedAt;
  final int? quantity;
  final List<Category>? categories;
  final List<Author>? authors;
  final Publisher? publisher;

  const Book({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.thumbnail,
    this.publishedAt,
    this.authors,
    this.categories,
    this.quantity,
    this.publisher,
  });

  // factory constructor
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description:
          json['description'] == null ? null : json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      publishedAt: json['published_at'] as String?,
      quantity: json['quantity'] == null
          ? null
          : json['quantity'] is int
              ? json['quantity'] as int
              : int.parse(json['quantity'] as String),
      categories: json['categories'] == null
          ? null
          : (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
      authors: json['authors'] == null
          ? null
          : (json['authors'] as List<dynamic>?)
              ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
              .toList(),
      publisher: json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'authors': authors?.map((e) => e.toJson()).toList(),
      'thumbnail': thumbnail,
      'categories': categories?.map((e) => e.toJson()).toList(),
      'published_at': publishedAt,
      'quantity': quantity,
      'publisher': publisher,
    };
  }

  // override
  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        description,
        authors,
        thumbnail,
        categories,
        publishedAt,
        quantity,
        publisher,
      ];
}
