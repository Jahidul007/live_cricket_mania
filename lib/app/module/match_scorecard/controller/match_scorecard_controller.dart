import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:cricket_mania/app/module/match_scorecard/data/model/match_scorecard_response.dart';
import 'package:cricket_mania/app/module/match_scorecard/data/repository/match_scorecard_repository.dart';
import 'package:rxdart/rxdart.dart';

class MatchScoreCardController extends BaseController {
  final _matchScorecardController = BehaviorSubject<MatchScorecardResponse>();

  Stream<MatchScorecardResponse> get matchScorecardStream =>
      _matchScorecardController.stream;

  final MatchScorecardRepository _matchScorecardRepository =
      MatchScorecardRepository();

  getMatchScorecard(String matchId) async {
    showLoadingState();
    var response =
        await _matchScorecardRepository.getMatchScorecard(matchId: matchId);

    handleApiCall(response, onSuccess: _onSuccessResponse);
  }

  _onSuccessResponse(BaseResponse response) {
    showSuccessState();
    MatchScorecardResponse _matchScorecardResponse =
        response as MatchScorecardResponse;

    _matchScorecardController.sink.add(_matchScorecardResponse);
  }

  @override
  void dispose() {
    _matchScorecardController.close();
    super.dispose();
  }
}
