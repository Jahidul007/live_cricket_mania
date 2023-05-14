import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:dio/dio.dart';

class SeriesResponse extends BaseResponse{
  Meta? meta;
  List<Results>? results;

  SeriesResponse({this.meta, this.results});

  SeriesResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  SeriesResponse.responseWithError(
      String message, DioErrorType? errorType) {
    isSuccess = false;
    msg = message;
    errorType = errorType;
  }
}

class Meta {
  String? description;
  String? title;

  Meta({this.description, this.title});

  Meta.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['title'] = title;
    return data;
  }
}

class Results {
  List<Series>? series;
  String? type;

  Results({this.series, this.type});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['series'] != null) {
      series = <Series>[];
      json['series'].forEach((v) {
        series!.add(Series.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (series != null) {
      data['series'] = series!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Series {
  String? season;
  int? seriesId;
  String? seriesName;
  String? status;
  String? updatedAt;

  Series(
      {this.season,
        this.seriesId,
        this.seriesName,
        this.status,
        this.updatedAt});

  Series.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    seriesId = json['series_id'];
    seriesName = json['series_name'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    data['series_id'] = seriesId;
    data['series_name'] = seriesName;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    return data;
  }
}
