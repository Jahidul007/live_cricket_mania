import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/core/repository/ApiHelper.dart';
import 'package:cricket_mania/app/module/core/repository/base_repository.dart';

class MatchResultsRepository extends BaseRepository {

  Future<MatchInfoResponse> getMatchResults({String? dateTime}) async {
   // String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String _baseUrl = "/results";
    if (dateTime != null) {
      _baseUrl = "/results-by-date/$dateTime";
    }
    return callApiAndHandleErrors(
          () async {
        var response = await apiHelper.get(
          _baseUrl,
        );
        return MatchInfoResponse.fromJson(response.data);
      },
          (message, errorType) async {
        return MatchInfoResponse.responseWithError(message, errorType);
      },
    );
  }
}
