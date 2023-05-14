import 'package:cricket_mania/app/utils/logger_provider.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final Logger logger = LoggerProvider.logger;

String handleDioError(DioError dioError) {
  String errorDescription = "";
  switch (dioError.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.other:
      errorDescription =
          "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.response:
      String? errorDes;
      String? serverMessage;
      String? error;
      String msg = "";

      try {
        error = dioError.response?.data["error"];
        errorDes = dioError.response?.data["error_description"];
        serverMessage = dioError.response?.data["message"];

        if (error != null && error.trim() != "") {
          msg = error;
          logger.d("error_handler: error - $error");
        }

        if (errorDes != null && errorDes != "") {
          msg = errorDes;
          logger.d("error_handler: errDes - $errorDes");
        }

        if (serverMessage != null && serverMessage.trim() != "") {
          msg = serverMessage;
          logger.d("error_handler: serverMessage - $serverMessage");
        }

        errorDescription = msg.isEmpty
            ? dioError.response?.data["errorMessage"] ??
                "Received invalid status code: ${dioError.response?.statusCode}"
            : msg;
        if(dioError.response?.statusCode == 401){
          errorDescription = "Unauthorized";
        }
      } on Exception catch (_) {
        if (dioError.response?.statusCode == 401) {
          errorDescription = "Unauthorized";
        }
      } catch (error) {
        if (dioError.response?.statusCode == 401) {
          errorDescription = "Unauthorized";
        }
      }

      break;

    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
  }
  logger.d("error_handler: logger.disable error - $errorDescription");
  return errorDescription;
}
