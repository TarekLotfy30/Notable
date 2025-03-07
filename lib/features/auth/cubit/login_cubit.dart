import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/app_regex.dart';
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

  String? validateEmail(String? value) {
    // Check if email is empty
    if (value == null || value.isEmpty) {
      return 'Email field is required.';
    }

    // Use existing AppRegex for email validation
    if (!AppRegex.isEmailValid(value)) {
      return 'Please enter a valid email address';
    }

    // Optional: Additional custom validation rules
    if (!value.contains('@')) {
      return 'Email must contain @ symbol';
    }

    // If all validations pass
    return null;
  }

  String? validatePassword(String? value) {
    // Check if password is empty
    if (value == null || value.isEmpty) {
      return 'Password field is required.';
    }

    // Use existing AppRegex for password validation
    if (!AppRegex.isPasswordValid(value)) {
      return 'Password must have:\n'
          '- At least 8 characters\n'
          '- At least 1 uppercase letter\n'
          '- At least 1 lowercase letter\n'
          '- At least 1 number\n'
          '- At least 1 special character';
    }

    // If all validations pass
    return null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
