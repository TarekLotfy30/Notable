import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/services/local/shared_keys.dart';
import '../../../../core/services/network/endpoints.dart';
import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  final LoginRepository loginRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isObscure = true;
  final Dio dio = Dio();

  void changeIsObscure() {
    isObscure = !isObscure;
    emit(ChangeIsObscure());
  }

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
        EndPoints.login,
        data: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        // Save token locally (if needed)
        // await local.set(
        //   key: AppSharedKeys.token.toString(),
        //   value: response.data['token'],
        // );
        emit(LoginSuccess());
      }
    } on DioException catch (error) {
      debugPrint('error: ${error}');
      // Convert DioException to ServerFailure
      final failure = ServerFailure.fromDioError(error);
      debugPrint('failure from server Failure: $failure');

      // Emit the error state with the failure message
      emit(LoginFailure(failure.errMessage));
    } on Exception catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
  //
  // Future<void> login() async {
  //   // emit(LoginLoading());
  //   // final result = await loginRepository.login(
  //   //   email: emailController.text,
  //   //   password: passwordController.text,
  //   // );
  //   // debugPrint('result: $result');
  //   // result.fold(
  //   //   (failure) => emit(LoginFailure(failure.errMessage)),
  //   //   (success) => emit(LoginSuccess()),
  //   // );
  //   emit(LoginLoading());
  //   try {
  //     await dio.post(
  //       EndPoints.login,
  //       data: {
  //         'email': emailController.text,
  //         'password': passwordController.text,
  //       },
  //     );
  //
  //     // await local.set(
  //     //   key: AppSharedKeys.token.toString(),
  //     //   value: response['data']['token'],
  //     // );
  //
  //     emit(LoginSuccess());
  //   } on Exception catch (error) {
  //     if (error is DioException) {
  //       return emit(
  //           LoginFailure(ServerFailure.fromDioError(error).errorMessage));
  //
  //       //return emit(LoginFailure();
  //     }
  //     return emit(LoginFailure(error.toString()));
  //   }
  // }

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
