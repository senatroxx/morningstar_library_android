part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoad extends AuthenticationState {}

class AuthenticationLoadDialog extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationLoggedIn extends AuthenticationState {
  final User user;
  const AuthenticationLoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationHasRegistered extends AuthenticationState {}

class AuthenticationHasReset extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String error;
  const AuthenticationFailure({required this.error});

  @override
  List<Object> get props => [];
}
