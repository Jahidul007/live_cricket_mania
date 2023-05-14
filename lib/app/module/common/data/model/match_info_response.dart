import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:dio/dio.dart';

class MatchInfoResponse extends BaseResponse {
  List<Results>? results;

  MatchInfoResponse({this.results});

  MatchInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  MatchInfoResponse.responseWithError(
      String message, DioErrorType? errorType) {
    isSuccess = false;
    msg = message;
    errorType = errorType;
  }
}

class Results {
  Away? away;
  String? date;
  Away? home;
  int? id;
  String? matchSubtitle;
  String? matchTitle;
  String? result;
  int? seriesId;
  String? status;
  String? venue;

  Results(
      {this.away,
      this.date,
      this.home,
      this.id,
      this.matchSubtitle,
      this.matchTitle,
      this.result,
      this.seriesId,
      this.status,
      this.venue});

  Results.fromJson(Map<String, dynamic> json) {
    away = json['away'] != null ? Away.fromJson(json['away']) : null;
    date = json['date'];
    home = json['home'] != null ? Away.fromJson(json['home']) : null;
    id = json['id'];
    matchSubtitle = json['match_subtitle'];
    matchTitle = json['match_title'];
    result = json['result'];
    seriesId = json['series_id'];
    status = json['status'];
    venue = json['venue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (away != null) {
      data['away'] = away!.toJson();
    }
    data['date'] = date;
    if (home != null) {
      data['home'] = home!.toJson();
    }
    data['id'] = id;
    data['match_subtitle'] = matchSubtitle;
    data['match_title'] = matchTitle;
    data['result'] = result;
    data['series_id'] = seriesId;
    data['status'] = status;
    data['venue'] = venue;
    return data;
  }
}

class Away {
  String? code;
  int? id;
  String? name;

  Away({this.code, this.id, this.name});

  Away.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
