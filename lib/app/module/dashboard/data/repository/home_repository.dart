
import 'package:cricket_mania/app/module/core/repository/ApiHelper.dart';
import 'package:cricket_mania/app/module/core/repository/base_repository.dart';
import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/dashboard/data/model/series_response.dart';
import 'package:intl/intl.dart';

class HomeRepository extends BaseRepository {
  Future<MatchInfoResponse> getFixtureMatches() async {
    String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    return callApiAndHandleErrors(
      () async {
        var response = await apiHelper.get(
          "/fixtures-by-date/$currentDate",
        );

        return MatchInfoResponse.fromJson(response.data);
      },
      (message, errorType) async {
        return MatchInfoResponse.responseWithError(message, errorType);
      },
    );
  }

  Future<SeriesResponse> getAllSeries() async {
    return callApiAndHandleErrors(
      () async {
        var response = await apiHelper.get(
          "/series",
        );

        return SeriesResponse.fromJson(response.data);
      },
      (message, errorType) async {
        return SeriesResponse.responseWithError(message, errorType);
      },
    );
  }

}
