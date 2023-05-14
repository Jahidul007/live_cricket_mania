
import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:cricket_mania/app/module/dashboard/data/model/series_response.dart';
import 'package:cricket_mania/app/module/dashboard/data/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

mixin SeriesMixin on BaseController {
  final BehaviorSubject<SeriesResponse?> _seriesController =
      BehaviorSubject<SeriesResponse?>();

  Stream<SeriesResponse?> get topUsersStream => _seriesController.stream;


  final HomeRepository homeRepository = HomeRepository();

  void getSeries() async {
    showLoadingState();
    var _topRepositories = await homeRepository.getAllSeries();
    handleApiCall(_topRepositories, onSuccess: _onSeriesSuccess);
  }

  _onSeriesSuccess(BaseResponse baseResponse) {
    showSuccessState();
    SeriesResponse topUserResponse = baseResponse as SeriesResponse;

    if (topUserResponse.isSuccess) {
      _seriesController.sink.add(topUserResponse);
    }
  }



  @override
  void dispose() {
    _seriesController.close();
    super.dispose();
  }
}
