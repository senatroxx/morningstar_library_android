import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morningstar_library/core/core.dart';
import 'package:morningstar_library/data/data.dart';
import 'package:morningstar_library/data/model/request/request.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void login({required String email, required String password}) async {
    try {
      emit(AuthenticationLoadDialog());
      User user = await AuthService().login(email: email, password: password);
      emit(AuthenticationLoggedIn(user: user));
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
    }
  }

  void register({
    required RequestRegister data,
  }) async {
    try {
      emit(AuthenticationLoadDialog());
      await AuthService().register(
        data: data.fromObjectToJson(),
      );
      emit(AuthenticationHasRegistered());
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
    }
  }

  void logout() async {
    try {
      emit(AuthenticationLoadDialog());
      await AuthService().logout();
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationSuccess());
    } finally {
      await StoreKeyValue().deleteToken();
    }
  }

  void forgotVerifyEmail(
      {required String email, bool resending = false}) async {
    try {
      if (resending) {
        emit(AuthenticationLoad());
      } else {
        emit(AuthenticationLoadDialog());
      }

      await AuthService().forgotVerifyEmail(email: email);

      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
    }
  }

  void resetPassword(
      {required String email,
      required String password,
      required String passwordConfirmation,
      required int otp}) async {
    try {
      emit(AuthenticationLoadDialog());
      await AuthService().resetPassword(
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          otp: otp);
      emit(AuthenticationHasReset());
    } catch (e) {
      emit(AuthenticationFailure(error: e.toString()));
    }
  }
}
