import 'package:flutter/widgets.dart';
import 'package:team_5_examapp/config/base_response/error_base_response_extension.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  T data;
  SuccessBaseResponse({required this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  final Object? error;
  final String? errorMessage;

  ErrorBaseResponse({this.error, this.errorMessage});

  //to call extension function to call it
  String getErrorMessage(BuildContext context) =>
      handleErrorMessage(context, error);
}
