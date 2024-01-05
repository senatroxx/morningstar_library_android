// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morningstar_library/core/core.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:morningstar_library/data/data.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  void setStatePaginate() {
    emit(const BookDataLoaded());
  }

  void fetch({int? page, int limit = 20, bool dataGrid = false}) async {
    if ((state as BookDataLoaded).statusWidget == StatusWidget.LOAD ||
        (state as BookDataLoaded).statusWidget == StatusWidget.LOADMORE) {
      return;
    }

    int _page = page ?? (state as BookDataLoaded).pagination.currentPage + 1;

    if (_page > (state as BookDataLoaded).pagination.totalPage) return;

    try {
      emit((state as BookDataLoaded).copyWith(
          statusWidget:
              _page == 1 ? StatusWidget.LOAD : StatusWidget.LOADMORE));

      Pagination<Book> paginateData =
          await BookService().fetch(page: _page, limit: limit);

      List<Book> books = List.of((state as BookDataLoaded).books);

      if (_page > 1 && !dataGrid) {
        books.addAll(paginateData.records);
      } else {
        books.clear();
        books.addAll(paginateData.records);
      }

      emit(
        (state as BookDataLoaded).copyWith(
          statusWidget: StatusWidget.SUCCESS,
          books: books,
          pagination: paginateData,
          loadMore: paginateData.currentPage < paginateData.totalPage,
        ),
      );
    } catch (e) {
      emit((state as BookDataLoaded)
          .copyWith(err: e.toString(), statusWidget: StatusWidget.FAILURE));
    }
  }

  void search(String query) async {
    try {
      emit((state as BookDataLoaded).copyWith(statusWidget: StatusWidget.LOAD));

      Pagination<Book> paginateData = await BookService().search(query);

      List<Book> books = List.of((state as BookDataLoaded).books);

      books.clear();
      books.addAll(paginateData.records);

      emit(
        (state as BookDataLoaded).copyWith(
          statusWidget: StatusWidget.SUCCESS,
          books: books,
          pagination: paginateData,
          loadMore: paginateData.currentPage < paginateData.totalPage,
        ),
      );
    } catch (e) {
      emit((state as BookDataLoaded)
          .copyWith(err: e.toString(), statusWidget: StatusWidget.FAILURE));
    }
  }

  void show({required String slug}) {
    emit((state as BookDataLoaded).copyWith(statusWidget: StatusWidget.LOAD));

    BookService().show(slug).then((value) {
      emit((state as BookDataLoaded).copyWith(
        statusWidget: StatusWidget.SUCCESS,
        books: [value],
        pagination: Pagination<Book>(
          currentPage: 1,
          totalPage: 1,
          records: [value],
        ),
        loadMore: false,
      ));
    }).catchError((e) {
      emit((state as BookDataLoaded)
          .copyWith(err: e.toString(), statusWidget: StatusWidget.FAILURE));
    });
  }
}
