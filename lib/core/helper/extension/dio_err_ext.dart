part of 'extension.dart';

extension DioErrExt on DioError {
  String msgDioErr() {
    if (response == null) {
      return error.toString();
    }

    int statusCode = response!.statusCode!;
    Map<String, dynamic>? meta = response!.data['meta'];

    var msg = "Something went wrong";

    if (statusCode == 422) {
      if (response!.data['error'] is List) {
        List _error = response!.data['error'];
        msg = _error.first;
      } else {
        msg = ((response!.data['error'] as Map).values.first as List).first;
      }
    } else if (statusCode == 404) {
      msg = "Tidak ditemukan";
    } else {
      if (meta != null) {
        msg = meta['message'];
      }
    }

    return msg;
  }
}
