import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/exceptions/api_exceptions.dart';
import '../../domain/utils/logger_helper.dart';

const String _kJsonContentType = 'application/json';

class ApiClient {
  final Dio _dio;

  ApiClient({
    required Dio dio,
    required String baseUrl,
  }) : _dio = dio {
    _addBaseOptions(_dio, baseUrl);
    _addPrettyDioLoggerInterceptor(_dio);
    _addRetryInterceptor(_dio);
  }

  String get baseUrl => _dio.options.baseUrl;

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw _getException(e);
    }
  }

  Future<T?> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw _getException(e);
    }
  }

  Future<T?> patch<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.patch<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw _getException(e);
    }
  }

  Future<T?> delete<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw _getException(e);
    }
  }

  static Exception _getException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ConnectionException();
      case DioExceptionType.badResponse:
        final response = error.response;
        final data = response?.data;
        final statusCode = response?.statusCode;

        String? message;
        List<String>? errors;

        if (data is Map<String, dynamic>) {
          message = data['message'];

          final errorMap = data['errors'];

          if (errorMap is Map<String, dynamic>) {
            errors = errorMap.values.map((e) => e.toString()).toList();
          }
        } else {
          message = error.message;
        }

        return ServerResponseException(
          message: message ?? '',
          statusCode: statusCode ?? 0,
          errors: errors ?? const [],
        );
      default:
        return const ServerUnknownException();
    }
  }

  void _addBaseOptions(Dio dio, String baseUrl) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
      contentType: _kJsonContentType,
      headers: {
        Headers.acceptHeader: _kJsonContentType,
      },
    );
  }

  void _addPrettyDioLoggerInterceptor(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        logPrint: LoggerHelper.logObject,
      ),
    );
  }

  void _addRetryInterceptor(Dio dio) {
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: LoggerHelper.logObject,
    ));
  }
}
