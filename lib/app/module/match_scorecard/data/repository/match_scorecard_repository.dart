import 'package:cricket_mania/app/module/core/repository/ApiHelper.dart';
import 'package:cricket_mania/app/module/core/repository/base_repository.dart';
import 'package:cricket_mania/app/module/match_scorecard/data/model/match_scorecard_response.dart';

class MatchScorecardRepository extends BaseRepository {
  Future<MatchScorecardResponse> getMatchScorecard(
      {required String matchId}) async {
    return callApiAndHandleErrors(
      () async {
        var response = await apiHelper.get(
          "/match/$matchId",
        );
        return MatchScorecardResponse.fromJson(response.data);
      },
      (message, errorType) async {
        return MatchScorecardResponse.responseWithError(message, errorType);
      },
    );
  }

}
