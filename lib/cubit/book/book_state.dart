part of 'book_cubit.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookDataLoaded extends BookState {
  final StatusWidget statusWidget;
  final Pagination<Book> pagination;
  final List<Book> books;
  final String? err;
  final bool loadMore;

  const BookDataLoaded({
    this.statusWidget = StatusWidget.INITIAL,
    this.pagination = const Pagination(),
    this.loadMore = false,
    this.books = const [],
    this.err,
  });

  BookDataLoaded copyWith({
    StatusWidget? statusWidget,
    Pagination<Book>? pagination,
    List<Book>? books,
    String? err,
    bool? loadMore,
  }) {
    return BookDataLoaded(
      err: err,
      books: books ?? this.books,
      pagination: pagination ?? this.pagination,
      statusWidget: statusWidget ?? this.statusWidget,
      loadMore: loadMore ?? this.loadMore,
    );
  }

  @override
  List<Object?> get props => [
        statusWidget,
        pagination,
        books,
        err,
        loadMore,
      ];
}
