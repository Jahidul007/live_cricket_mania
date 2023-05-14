import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  String getContentType({String? versionNo}) {
    return "application/json";
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = getContentType();

    return super.onRequest(options, handler);
  }
}
