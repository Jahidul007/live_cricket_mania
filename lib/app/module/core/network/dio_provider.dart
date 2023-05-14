import 'package:cricket_mania/app/module/core/interceptors/request_header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



const int _maxLineWidth = 700;
final _prettyDioLogger = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: _maxLineWidth,
);

Dio httpDio(
    {bool? shouldRetryOnError = true, String baseUrl = "",}) {
  final _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
  );

  Dio _instance = Dio(_options)
    ..interceptors.add(_prettyDioLogger)
    ..interceptors.add(RequestHeaderInterceptor());
  return _instance;
}

Dio httpDioWithoutRefresh() {
  return Dio()
    ..interceptors.add(_prettyDioLogger)
    ..interceptors.add(RequestHeaderInterceptor());
}

