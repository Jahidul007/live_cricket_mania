import 'package:cricket_mania/app/module/dashboard/data/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
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

  group("getCurrentSeries", () {
    test("check internet connection", () async {
      when(() => _tDio.get(baseUrl, options: any(named: "options"))).thenAnswer(
          (realInvocation) async => Response(
              requestOptions: RequestOptions(path: baseUrl),
              statusCode: 500,
              data: any(),
              statusMessage: 'something went wrong'));

      var response = await _tHomeRepository.getAllSeries();

      expect(response.isSuccess, false);
      expect(response.msg,
          'Connection to API server failed due to internet connection');
    });

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

      when(() => _tDio.post(baseUrl, data: any))
          .thenAnswer((realInvocation) async => response);

      var response1 = _tHomeRepository.getAllSeries();

      expect(response, response1);
    });

    test("get error response when status code is not 200", () async {
      when(() => _tDio.get(baseUrl, options: any(named: "options"))).thenAnswer(
          (realInvocation) async => Response(
              requestOptions: RequestOptions(path: baseUrl),
              statusCode: 500,
              data: any(),
              statusMessage: 'something went wrong'));

      var response = await _tHomeRepository.getAllSeries();

      expect(response.isSuccess, false);
      expect(response.msg,
          'Connection to API server failed due to internet connection');
    });
  });
}
