import 'package:dio/dio.dart';

mixin HeaderProvider {
  Future<Options> getHeaders({
    String? rapidApiKey,
    String? rapidApiHost,
    String? versionCode,
    bool? timeZone,
  }) async {
    final option = Options(headers: <String, String>{
      'Content-Type': getContentType(),
      'X-RapidAPI-Key': rapidApiKey ?? "",
      'X-RapidAPI-Host': rapidApiHost ?? ""
    });

    return option;
  }

  String getContentType({String? versionNo}) {
    return "application/json";
  }
}
