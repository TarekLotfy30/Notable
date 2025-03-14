// import 'package:dio/dio.dart';
//
// import 'error_messages.dart';
// import 'server_failure.dart';
//
// // Responsible for mapping Dio errors to server failures
//
// class DioErrorMapper {
//   ServerFailure mapDioErrorToServerFailure(DioException dioError) {
//     switch (dioError.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure(ErrorMessages.connectionTimeout);
//       case DioExceptionType.sendTimeout:
//         return ServerFailure(ErrorMessages.sendTimeout);
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure(ErrorMessages.receiveTimeout);
//       case DioExceptionType.cancel:
//         return ServerFailure(ErrorMessages.requestCancelled);
//       case DioExceptionType.badCertificate:
//         return ServerFailure(ErrorMessages.badCertificate);
//       case DioExceptionType.connectionError:
//         return ServerFailure(ErrorMessages.connectionError);
//       case DioExceptionType.unknown:
//         if (dioError.message?.contains('SocketException') ?? false) {
//           return ServerFailure(ErrorMessages.noInternet);
//         }
//         return ServerFailure(ErrorMessages.unexpectedError);
//       case DioExceptionType.badResponse:
//         return _handleBadResponse(dioError.response);
//     }
//   }
//
//   ServerFailure _handleBadResponse(Response? response) {
//     if (response == null) {
//       return ServerFailure(ErrorMessages.nullResponse);
//     }
//
//     final statusCode = response.statusCode;
//     if (ErrorMessages.httpStatusMessages.containsKey(statusCode)) {
//       return ServerFailure(ErrorMessages.httpStatusMessages[statusCode]!);
//     }
//
//     return ServerFailure(
//       'Unknown status code: $statusCode. ${ErrorMessages.genericError}',
//     );
//   }
// }
