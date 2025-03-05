part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangeIsObscure extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  LoginFailure(this.message);
  final String message;
}

final class LoginLoading extends LoginState {}
