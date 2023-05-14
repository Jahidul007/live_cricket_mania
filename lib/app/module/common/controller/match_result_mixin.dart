import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:cricket_mania/app/module/match_results/data/repository/match_results_repository.dart';
import 'package:rxdart/rxdart.dart';

mixin MatchResultsMixin on BaseController{
  final BehaviorSubject<MatchInfoResponse?> _matchResultsController =
  BehaviorSubject<MatchInfoResponse?>();

  Stream<MatchInfoResponse?> get matchResultsStream =>
      _matchResultsController.stream;

  final MatchResultsRepository _matchResultsRepository =
  MatchResultsRepository();

  Future<void> getMatchResults({String? dateTime}) async {
    showLoadingState();
    var response =
    await _matchResultsRepository.getMatchResults(dateTime: dateTime);
    handleApiCall(response, onSuccess: _onMatchResultSuccess);
  }

  _onMatchResultSuccess(BaseResponse baseResponse) {
    showSuccessState();
    MatchInfoResponse _matchInfoResponse = baseResponse as MatchInfoResponse;

    if (_matchInfoResponse.isSuccess) {
      _matchResultsController.sink.add(_matchInfoResponse);
    }
  }

  @override
  void dispose() {
    _matchResultsController.close();
    super.dispose();
  }
}
