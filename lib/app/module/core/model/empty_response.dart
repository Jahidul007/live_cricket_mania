import 'package:dio/dio.dart';
import 'base_response.dart';

class EmptyResponse extends BaseResponse{

  EmptyResponse();

  @override
  factory EmptyResponse.responseWithError(String message, DioErrorType? errorType)
  {
    return EmptyResponse()
      ..isSuccess = false
      ..msg = message
      ..dioErrorType = errorType;
  }
}