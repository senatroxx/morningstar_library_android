part of 'model.dart';

class Home extends Equatable {
  final List<Category>? categories;
  final List<Book>? featuredBooks;
  final List<Book>? recentBooks;
  final List<Book>? randomBooks;
  final List<Book>? latestNovel;
  final List<Book>? latestComic;
  final List<Book>? latestFinancial;

  const Home({
    this.categories,
    this.featuredBooks,
    this.recentBooks,
    this.randomBooks,
    this.latestNovel,
    this.latestComic,
    this.latestFinancial,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      categories: json['categories'] == null
          ? null
          : (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
      featuredBooks: json['featuredBooks'] == null
          ? null
          : (json['featuredBooks'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList(),
      recentBooks: json['recentBooks'] == null
          ? null
          : (json['recentBooks'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList(),
      randomBooks: json['randomBooks'] == null
          ? null
          : (json['randomBooks'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList(),
      latestNovel: json['latestNovel'] == null
          ? null
          : (json['latestNovel'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList(),
      latestComic: json['latestComic'] == null
          ? null
          : (json['latestComic'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList(),
      latestFinancial: json['latestFinancial'] == null
          ? null
          : (json['latestFinancial'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
      'featuredBooks': featuredBooks,
      'recentBooks': recentBooks,
      'randomBooks': randomBooks,
      'latestNovel': latestNovel,
      'latestComic': latestComic,
      'latestFinancial': latestFinancial,
    };
  }

  @override
  List<Object?> get props => [
        categories,
        featuredBooks,
        recentBooks,
        randomBooks,
        latestNovel,
        latestComic,
        latestFinancial,
      ];
}
