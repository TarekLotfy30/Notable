import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'endpoints.dart';

class DioHelper {
  DioHelper(this._dio) {
    // Debug print for initialization
    debugPrint('🚀 Initializing DioHelper');
    debugPrint('Base URL: ${EndPoints.baseUrl}');

    const Duration timeOut = Duration(seconds: 20);

    _dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
      responseType: ResponseType.json,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      validateStatus: (status) {
        debugPrint('📊 Validate Status: $status');
        return status! < 500;
      },
    );

   // addDioInterceptor();
    // _dio.interceptors.add(
    //   LogInterceptor(
    //     requestBody: true,
    //     responseBody: true,
    //     error: true,
    //     requestHeader: true,
    //     responseHeader: true,
    //     request: true,
    //   ),
    // );

    // Final debug print for initialization complete
    debugPrint('✅ DioHelper Initialization Complete');
  }

  final Dio _dio;

  // void addDioInterceptor() {
  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         debugPrint('==================== REQUEST START ====================');
  //         debugPrint('Request Method: ${options.method}');
  //         debugPrint('Request URL: ${options.uri}');
  //         debugPrint('Request Headers: ${options.headers}');
  //         debugPrint('Request Data: ${options.data}');
  //         debugPrint('Request Query Parameters: ${options.queryParameters}');
  //         debugPrint('==================== REQUEST END ====================');
  //         return handler.next(options);
  //       },
  //       onResponse: (response, handler) {
  //         debugPrint('==================== RESPONSE START ===================');
  //         debugPrint('Response Status Code: ${response.statusCode}');
  //         debugPrint('Response Headers: ${response.headers}');
  //         debugPrint('Response Data: ${response.data}');
  //         debugPrint('==================== RESPONSE END ====================');
  //         return handler.next(response);
  //       },
  //       onError: (e, handler) {
  //         debugPrint('==================== ERROR START ====================');
  //         debugPrint('DioException Type: ${e.type}');
  //         debugPrint('DioException Message: ${e.message}');
  //         debugPrint('Error Response: ${e.response}');
  //         debugPrint('Error Request Options: ${e.requestOptions}');
  //         debugPrint('==================== ERROR END ====================');
  //         return handler.next(e);
  //       },
  //     ),
  //   );
  // }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? token,
    String? language,
  }) async {
    final options = Options(headers: headers);

    // Add token to headers if provided
    if (token != null) {
      options.headers?['Authorization'] = 'Bearer $token';
    }

    // Add language to headers if provided
    if (language != null) {
      options.headers?['Accept-Language'] = language;
    }

    debugPrint('==================== GET REQUEST START ====================');
    debugPrint('Endpoint: $endPoint');
    debugPrint('Params: $params');
    debugPrint('Body: $body');

    final response = await _dio.get(
      endPoint,
      queryParameters: params,
      data: body,
      options: options,
    );

    debugPrint('Request URL: ${response.requestOptions.uri}');
    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Data: ${response.data}');
    debugPrint('==================== GET REQUEST END ====================');

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? token,
    String? language,
  }) async {
    final options = Options(headers: headers);

    // Add token to headers if provided
    if (token != null) {
      options.headers?['Authorization'] = 'Bearer $token';
    }

    // Add language to headers if provided
    if (language != null) {
      options.headers?['Accept-Language'] = language;
    }

    debugPrint('==================== POST REQUEST START =================');
    debugPrint('Endpoint: $endPoint');
    debugPrint('Params: $params');
    debugPrint('Body: $body');

    final response = await _dio.post(
      endPoint,
      queryParameters: params,
      data: body,
      options: options,
    );

    debugPrint('Request URL: ${response.requestOptions.uri}');
    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Data: ${response.data}');
    debugPrint('==================== POST REQUEST END ====================');

    return response.data;
  }
}
