part of '../core.dart';

class BookService extends Services {
  BookService()
      : super(
          options: BaseOptions(
            baseUrl: MorningstarAPI.baseUrl,
            connectTimeout: const Duration(hours: 1),
            receiveTimeout: const Duration(hours: 1),
          ),
        );

  Future<Pagination<Book>> fetch(
      {required int page, required int limit}) async {
    try {
      Response response = await get(MorningstarAPI.books, queryParameters: {
        'page': page,
        'limit': limit,
      });

      var data = response.data['data'];

      data['records'] =
          (data['data'] as List).map((e) => Book.fromJson(e)).toList();

      return Pagination<Book>.fromJson(data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<Pagination<Book>> search(String query, {int? page, int? limt}) async {
    try {
      Response response = await get(MorningstarAPI.books, queryParameters: {
        'q': query,
        'page': page,
        'limit': limt,
      });

      var data = response.data['data'];

      data['records'] =
          (data['data'] as List).map((e) => Book.fromJson(e)).toList();

      return Pagination<Book>.fromJson(data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<Book> show(String slug) async {
    try {
      Response response = await get("${MorningstarAPI.books}/$slug");

      return Book.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }
}
