import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../data/models/login_response.dart';
import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  final LoginRepository loginRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isObscure = true;

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(PasswordVisibilityChanged(isVisible: isObscure));
  }

  Future<void> login() async {
    emit(LoginLoading());
    final result = await loginRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );
    debugPrint('result: $result');
    result.fold(
      (failure) => emit(LoginFailure(failure.errorMessage)),
      (loginResponse) => emit(LoginSuccess(loginResponse)),
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

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!AppRegex.hasUpperCase(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!AppRegex.hasLowerCase(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!AppRegex.hasNumber(value)) {
      return 'Password must contain at least one number';
    }

    if (!AppRegex.hasSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
    }

    if (value.contains('\n')) {
      return 'Password cannot contain newlines';
    }

    return null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
