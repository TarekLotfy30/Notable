part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class PasswordVisibilityChanged extends LoginState {
  PasswordVisibilityChanged({required this.isVisible});
  final bool isVisible;
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess(this.loginResponse);
  final LoginResponse loginResponse;
}

class LoginFailure extends LoginState {
  LoginFailure(this.message);
  final String message;
}
