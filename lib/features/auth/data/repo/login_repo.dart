import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
}
