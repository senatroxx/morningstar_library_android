part of '../core.dart';

class HomeService extends Services {
  HomeService()
      : super(
          options: BaseOptions(
            baseUrl: MorningstarAPI.baseUrl,
            connectTimeout: const Duration(hours: 1),
            receiveTimeout: const Duration(hours: 1),
          ),
        );

  Future<Home> fetch() async {
    try {
      Response response = await get(MorningstarAPI.home);

      var data = response.data['data'];

      return Home.fromJson(data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }
}
