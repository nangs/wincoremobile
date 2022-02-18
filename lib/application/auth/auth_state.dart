part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errorMsg;
  AuthError(this.errorMsg);
}

class AuthLoginSuccess extends AuthState {
  final AuthResponse dataLogin;
  AuthLoginSuccess(this.dataLogin);
}

class AuthLogoutSuccess extends AuthState {
  final String dataLogin;
  AuthLogoutSuccess(this.dataLogin);
}
