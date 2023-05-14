import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/dashboard/data/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

mixin FixturesMatchesMixin on BaseController {
  final BehaviorSubject<MatchInfoResponse?> _fixturesMatchesController =
      BehaviorSubject<MatchInfoResponse?>();

  Stream<MatchInfoResponse?> get fixturesMatchStream =>
      _fixturesMatchesController.stream;

  final HomeRepository homeRepository = HomeRepository();

  void getFixturesMatches() async {
    showLoadingState();
    var response = await homeRepository.getFixtureMatches();
    handleApiCall(response, onSuccess: _onFeaturedMatchesSuccess);
  }

  _onFeaturedMatchesSuccess(BaseResponse baseResponse) {
    showSuccessState();
    MatchInfoResponse _matchInfoResponse = baseResponse as MatchInfoResponse;

    if (_matchInfoResponse.isSuccess) {
      _fixturesMatchesController.sink.add(_matchInfoResponse);
    }
  }

  final _activePageController = BehaviorSubject<int>.seeded(0);

  Stream<int> get activePage => _activePageController.stream;

  updateActivePage(int val) {
    _activePageController.sink.add(val);
  }

  @override
  void dispose() {
    _fixturesMatchesController.close();
    super.dispose();
  }
}
