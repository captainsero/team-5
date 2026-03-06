sealed class BaseResponse<T> {}

class SucceessBaseResponse<T> extends BaseResponse<T> {
  T data;
  SucceessBaseResponse({required this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  String errorMessage;
  ErrorBaseResponse({required this.errorMessage});
}
