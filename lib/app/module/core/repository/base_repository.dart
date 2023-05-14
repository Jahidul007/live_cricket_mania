import 'package:cricket_mania/app/module/core/network/dio_provider.dart';
import 'package:cricket_mania/app/module/core/repository/ApiHelper.dart';

abstract class BaseRepository {
  final apiHelper = ApiBaseHelper(
    'https://cricket-live-data.p.rapidapi.com',
    httpDio(),
  );
}
