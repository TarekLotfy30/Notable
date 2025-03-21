import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure,LoginResponse>> login({
    required String email,
    required String password,
  });
}
