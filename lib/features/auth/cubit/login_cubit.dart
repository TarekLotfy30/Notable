import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  final LoginRepository loginRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool isObscure = true;
  void changeIsObscure() {
    isObscure = !isObscure;
    emit(ChangeIsObscure());
  }

  Future<void> login() async {
    emit(LoginLoading());
    final result = await loginRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.errorMessage)),
      (_) => emit(LoginSuccess()),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
