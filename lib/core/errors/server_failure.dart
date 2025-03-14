// // server_failure.dart
// import 'package:dio/dio.dart';
// import 'dio_error_mapper.dart';
// import 'failure.dart';
//
// // Simplified to only represent a failure
// class ServerFailure extends Failure {
//   ServerFailure(super.errorMessage);
//
//   factory ServerFailure.fromDioError(DioException dioError) {
//     final errorMapper = DioErrorMapper();
//     return errorMapper.mapDioErrorToServerFailure(dioError);
//   }
// }
