part of '../core.dart';

abstract class Services {
  BaseOptions? options = BaseOptions(
    baseUrl: MorningstarAPI.baseUrl,
    connectTimeout: const Duration(hours: 1),
    receiveTimeout: const Duration(hours: 1),
  );

  Services({this.options});

  Dio dio() {
    Dio dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          // requestHeader: false,
          // requestBody: true,
          responseBody: false,
          // responseHeader: false,
          // error: true,
          // compact: false,
          maxWidth: 90));
    }
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        request.headers['Accept'] = 'application/json';
        request.headers['Content-Type'] = 'application/json';
        String? token = await StoreKeyValue().getToken();
        if (token != null && token.isNotEmpty) {
          request.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(request);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401 &&
            !e.requestOptions.path.contains("/auth/login")) {
          await StoreKeyValue().deleteToken();
          await StoreKeyValue().deleteUser();
          Modular.to.navigate(Routes.login);
          return;
        } else {
          handler.next(e);
        }
      },
    ));
    return dio;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio().get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParamaters}) async {
    return await dio().post(
      path,
      data: data,
      queryParameters: queryParamaters,
    );
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    return await dio().put(path, data: data);
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParamaters}) async {
    return await dio().delete(path, queryParameters: queryParamaters);
  }
}
