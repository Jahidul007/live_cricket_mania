import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/dashboard/data/model/series_response.dart';
import 'package:cricket_mania/app/module/dashboard/data/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late HomeRepository _tHomeRepository;
  late Dio _tDio;
  const String baseUrl = '';

  setUp(() async {
    _tDio = MockDioClient();
    _tHomeRepository = HomeRepository();
  });

  group("fetchSeries", () {
    test("get series data with status code 200", () async {
      String responseData = """
    {
         meta: {title: Cricket API - Series Listing, description: Full Listing of currently covered series broken down by series type},
         results: [
            {
                 type: "Test",
                 series: [
                  {series_id: 1443, series_name: Ireland in Sri Lanka Test Series, status: Result Sri Lanka 2-0 (2), season: 2023, updated_at: 2023-05-13T23:00:07.000000Z}
                  ]
            }
         ]
    }
    """;

      var response = Response(
        requestOptions: RequestOptions(path: baseUrl),
        data: responseData,
        statusCode: 200,
      );

      when(() => _tDio.get(baseUrl))
          .thenAnswer((realInvocation) async => response);

      var response1 = await _tHomeRepository.getAllSeries()
        ..isSuccess = true;

      expect(response1, isA<SeriesResponse>());
      expect(response1.isSuccess, true);
    });

    test("get error response when status code is not 200", () async {
      when(() => _tDio.get(baseUrl, options: any(named: "options"))).thenAnswer(
          (realInvocation) async => Response(
              requestOptions: RequestOptions(path: baseUrl),
              statusCode: 500,
              data: any(),
              statusMessage: 'something went wrong'));

      var response = await _tHomeRepository.getAllSeries()
        ..isSuccess = false
        ..msg = "Something went wrong";

      expect(response.isSuccess, false);
      expect(response.msg, 'Something went wrong');
    });
  });
  
  group("fetchFixtures", () { 
    
    test("fetch current date fixtures", () async{
      var response = Response(
        requestOptions: RequestOptions(path: baseUrl),
        data: any,
        statusCode: 200,
      );

      when(() => _tDio.get(baseUrl))
          .thenAnswer((realInvocation) async => response);

      String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

      var response1 = await _tHomeRepository.getFixtureMatches(dateTime: currentDate)
        ..isSuccess = true;

      expect(response1, isA<MatchInfoResponse>());
      expect(response1.isSuccess, true);
    });

    test("get error response when date time goes wrong format", () async {
      when(() => _tDio.get(baseUrl, options: any(named: "options"))).thenAnswer(
              (realInvocation) async => Response(
              requestOptions: RequestOptions(path: baseUrl),
              statusCode: 500,
              data: any(),
              statusMessage: 'something went wrong'));
      String currentDate = DateFormat("yyyy-MMM-dd").format(DateTime.now());

      var response = await _tHomeRepository.getFixtureMatches(dateTime: currentDate)
        ..isSuccess = false
        ..msg = "Something went wrong";

      expect(response.isSuccess, false);
      expect(response.msg, 'Something went wrong');
    });

  });

}
