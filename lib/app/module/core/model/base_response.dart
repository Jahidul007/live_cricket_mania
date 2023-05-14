import 'package:dio/dio.dart';



class BaseResponse {
  bool isSuccess = false;
  String msg = "";
  DioErrorType? dioErrorType;
  //String? dioErrorType;
  int? responseCode;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'] ?? false;
    responseCode = json['responseCode'] ?? 0;
    msg = json['message']?? '';
  }

  fromBaseResponseJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'] ?? false;
    responseCode = json['responseCode'] ?? 0;
    dioErrorType = json['dioErrorType'];
    msg = json['message']?? '';
  }

  BaseResponse({this.isSuccess = true, this.msg = "", this.responseCode});
}