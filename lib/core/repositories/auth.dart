part of '../core.dart';

class AuthService extends Services {
  AuthService()
      : super(
          options: BaseOptions(
            baseUrl: MorningstarAPI.baseUrl,
            connectTimeout: const Duration(hours: 1),
            receiveTimeout: const Duration(hours: 1),
          ),
        );

  Future<void> register({required Map<String, dynamic> data}) async {
    try {
      await post(MorningstarAPI.register, data: data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<User> login({required String email, required String password}) async {
    try {
      final _data = {"email": email, "password": password};
      Response response = await post(MorningstarAPI.login, data: _data);
      var data = response.data['data'];
      var user = User.fromJson(data['user']);
      await StoreKeyValue().setToken(data['token']);
      await StoreKeyValue().setUser(user);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw "Username/password salah";
      }
      throw e.msgDioErr();
    }
  }

  Future<void> logout() async {
    try {
      // await post(MorningstarAPI.logout);
      await StoreKeyValue().deleteToken();
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<void> forgotVerifyEmail({required String email}) async {
    try {
      final data = {
        "email": email,
      };
      await post(MorningstarAPI.forgotVerifyEmail, data: data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<void> resetPassword(
      {required String email,
      required String password,
      required String passwordConfirmation,
      required int otp}) async {
    try {
      final data = {
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "otp": otp,
      };
      await post(MorningstarAPI.forgotResetPassword, data: data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }
}
