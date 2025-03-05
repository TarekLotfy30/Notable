// Contains all error message constants
class ErrorMessages {
  const ErrorMessages._();

  // Network related error messages
  static const String connectionTimeout = 'Connection timeout with ApiServer';
  static const String sendTimeout = 'Send timeout with ApiServer';
  static const String receiveTimeout = 'Receive timeout with ApiServer';
  static const String requestCancelled = 'Request to ApiServer was canceled';
  static const String badCertificate = 'Bad Certificate';
  static const String connectionError = 'Connection Error';
  static const String noInternet = 'No Internet Connection';
  static const String unexpectedError = 'Unexpected Error, Please try again!';
  static const String genericError = 'Oops,There was an Error, try again';
  static const String nullResponse = 'Response was null';

  // HTTP status code error messages
  static const Map<int, String> httpStatusMessages = {
    400: 'Bad Request',
    401: 'Unauthorized',
    403: 'Forbidden',
    404: 'Your request was not found, please try later!',
    500: 'Internal Server error, please try later',
  };
}
