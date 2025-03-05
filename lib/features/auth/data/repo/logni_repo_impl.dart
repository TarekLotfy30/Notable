import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/services/local/local_helper.dart';
import '../../../../core/services/local/shared_keys.dart';
import '../../../../core/services/network/dio_helper.dart';
import '../../../../core/services/network/endpoints.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepository {
  LoginRepoImpl({
    required this.dio,
    required this.local,
  });

  final DioHelper dio;
  final LocalHelper local;

  @override
  Future<Either<Failure, void>> login({
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

      final token = response['data']['token'];

      local.set(
        key: AppSharedKeys.token.toString(),
        value: token,
      );
      return const Right(null); // Returns void on success
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
