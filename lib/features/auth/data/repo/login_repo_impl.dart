import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/local/local_helper.dart';
import '../../../../core/services/local/shared_keys.dart';
import '../../../../core/services/network/dio_helper.dart';
import '../../../../core/services/network/endpoints.dart';
import '../models/login_response.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepository {
  LoginRepoImpl({
    required this.dio,
    required this.local,
  });

  final DioHelper dio;
  final LocalHelper local;
  @override
  Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        endPoint: EndPoints.login,
        body: {
          'email': email,
          'password': password,
        },
      );
      final loginResponse = LoginResponse.fromJson(response.data);
      // Check status before processing
      if (response.statusCode != 200) {
        throw DioException(requestOptions: response.requestOptions);
      }
      // Validate response structure
      if (response.data == null) {
        return const Left(Failure('Invalid response format from server'));
      }
      
      await local.set(
        key: AppSharedKeys.token.toString(),
        value: loginResponse.data?.token,
      );
      return Right(response.data);
    } on DioException catch (e) {
      debugPrint("DioException: ${e.toString()}");
      debugPrint("DioException: ${e.response?.data}");
      debugPrint("DioException: ${e.type}");
      return Left(Failure.fromDioError(e));
    } on Failure catch (_) {
      rethrow;
    }
  }
}
