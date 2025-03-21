import 'package:dio/dio.dart';

import 'error_messages.dart';

class Failure implements Exception {
  const Failure(this.errorMessage);

  factory Failure.handleBadResponse(DioException exception) {
    if (exception.response == null) {
      return const Failure(ErrorMessages.nullResponse);
    }

    final statusCode = exception.response!.statusCode;
    if (ErrorMessages.httpStatusMessages.containsKey(statusCode)) {
      return Failure(ErrorMessages.httpStatusMessages[statusCode]!);
    }
    return Failure(
      'Unknown status code: $statusCode. ${ErrorMessages.genericError}',
    );
  }

  factory Failure.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const Failure(ErrorMessages.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return const Failure(ErrorMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return const Failure(ErrorMessages.receiveTimeout);
      case DioExceptionType.cancel:
        return const Failure(ErrorMessages.requestCancelled);
      case DioExceptionType.badResponse:
        return Failure.handleBadResponse(exception);
      case DioExceptionType.unknown:
        if (exception.message?.contains('SocketException') ?? false) {
          return const Failure(ErrorMessages.noInternet);
        }
        return const Failure(ErrorMessages.unexpectedError);
      default:
        return Failure.handleBadResponse(exception);
    }
  }
  final String errorMessage;
}
