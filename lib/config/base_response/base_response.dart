import 'dart:async';

import 'package:dio/dio.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  T data;
  SuccessBaseResponse({required this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  late String errorMessage;
  ErrorBaseResponse({Object? error, String? errorMessage}) {
    errorMessage = _extractErrorMessage();
  }

  static String _extractErrorMessage({Object? error}) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return "Request timed out. Please check your internet connection.";

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          if (statusCode >= 500) return "Server error. Please try again later.";
          if (statusCode == 404) return "Requested resource not found.";
          return "Something went wrong. Please try again.";

        case DioExceptionType.unknown:
          return "Network error. Please check your connection.";

        default:
          return "Something went wrong. Please try again.";
      }
    }

    if (error is TimeoutException) {
      return "Request timed out. Please try again.";
    }
    // Fallback for any other exception
    return "Something went wrong. Please try again later.";
  }
}
