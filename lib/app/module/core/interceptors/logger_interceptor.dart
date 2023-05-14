
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  static const int _maxCharactersPerLine = 500;



  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("--> ${options.method} ${options.path}");
    debugPrint("Headers: ${options.headers}");
    if (options.data != null) debugPrint("data: ${options.data.toString()}");
    if (options.queryParameters != null) {
      debugPrint("query params: ${options.queryParameters}");
    }
    debugPrint("<-- END HTTP");

    super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // debugPrint(jsonEncode(response.data));
    debugPrint(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
      (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint(response.data);
    }
    debugPrint("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("<-- Error -->");
    debugPrint(err.error);
    debugPrint(err.message);
    super.onError(err, handler);
  }
}
