import 'package:dio/dio.dart';

/// Apps or modules that use DioProvider
/// will have to pass an implementation of this class
abstract class TokenRefreshInterceptor extends InterceptorsWrapper{}
