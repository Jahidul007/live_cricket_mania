import 'dart:convert';
import 'dart:io';
import 'package:cricket_mania/app/module/core/network/error_handlers.dart';
import 'package:cricket_mania/app/module/core/repository/header_provider_mixin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class ApiBaseHelper with HeaderProvider {
  final String _baseUrl;
  final Dio _dio;

  ApiBaseHelper(this._baseUrl, this._dio);

  _handleSocketException() {
    debugPrint('No net');
    throw FetchDataException('No Internet connection');
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;

    final _option = await getHeaders(
      rapidApiKey: '1eb8908108mshcd5217b19ab23a0p178b3cjsn4b669842dc40',
      rapidApiHost: "cricket-live-data.p.rapidapi.com",
    );

    try {
      var response = await _dio.get(
        "$_baseUrl$url",
        options: _option,
        queryParameters: queryParameters,
      );

      return response;
    } on SocketException {
      _handleSocketException();
    }

    return responseJson;
  }

  Future<dynamic> getLocalJson(String path) async {
    String localJson = await rootBundle.loadString(path);
    Map<String, dynamic> response = await jsonDecode(localJson);
    return response;
  }
}

class FetchDataException extends CricketManiaAppException {
  FetchDataException(String? message)
      : super(message!, "Error During Communication: ");
}

class CricketManiaAppException implements Exception {
  final String _message;
  final String _prefix;

  CricketManiaAppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

Future<T> callApiAndHandleErrors<T>(
  Future<T> Function() apiCall,
  Future<T> Function(String message, DioErrorType? errorType) responseWithError,
) async {
  try {
    return await apiCall();
  } on DioError catch (e) {
    String error = handleDioError(e);
    return responseWithError(error, e.type); // this shows error
  } catch (error, stacktrace) {
    logger.d("Exception occurred: $error stackTrace: $stacktrace");
    return responseWithError(error.toString(), null); // this is okay
  }
}
