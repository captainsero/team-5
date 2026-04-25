import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';

class ResponseHandler {
  static BaseState<T> handle<T>(BaseResponse<T> response) {
    switch (response) {
      case SuccessBaseResponse<T>():
        return BaseState(
          data: response.data,
          isLoading: false,
          errorMessage: null,
        );
      case ErrorBaseResponse<T>():
        return BaseState(
          data: null,
          isLoading: false,
          errorMessage: response.errorMessage,
        );
    }
  }
}
