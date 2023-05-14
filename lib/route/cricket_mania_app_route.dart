import 'package:cricket_mania/app/module/dashboard/data/model/series_response.dart';
import 'package:cricket_mania/app/module/dashboard/screen/dashboard_screen.dart';
import 'package:cricket_mania/app/module/fixtures/screen/fixtures_screen.dart';
import 'package:cricket_mania/app/module/match_results/screen/match_results_screen.dart';
import 'package:cricket_mania/app/module/match_scorecard/screen/match_scorecard_details_screen.dart';
import 'package:cricket_mania/app/module/series/screen/series_screen.dart';
import 'package:cricket_mania/app/module/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class CricketManiaAppRoute {
  static const String splash = "/splash";

  static const String homeScreen = '/homeScreen';
  static const String resultsScreen = '/resultsScreen';
  static const String seriesScreen = '/seriesScreen';
  static const String fixturesScreen = '/fixturesScreen';
  static const String matchScoreCaredScreen = '/matchScoreCaredScreen';
}

MaterialPageRoute? getCricketManiaAppRoutes(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        settings: const RouteSettings(name: CricketManiaAppRoute.splash),
        builder: (_) => const SplashScreen(),
      );

    case CricketManiaAppRoute.homeScreen:
      return MaterialPageRoute(
        settings: const RouteSettings(name: CricketManiaAppRoute.homeScreen),
        builder: (_) => const HomeScreen(),
      );

    case CricketManiaAppRoute.resultsScreen:
      return MaterialPageRoute(
        settings: const RouteSettings(name: CricketManiaAppRoute.resultsScreen),
        builder: (_) => const MatchResultsScreen(),
      );

    case CricketManiaAppRoute.seriesScreen:
      List<Series>? series;
      if (args is List<Series>) {
        series = args;
      }
      return MaterialPageRoute(
        settings: const RouteSettings(name: CricketManiaAppRoute.seriesScreen),
        builder: (_) => SeriesScreen(
          series: series!,
        ),
      );

    case CricketManiaAppRoute.fixturesScreen:
      return MaterialPageRoute(
        settings:
            const RouteSettings(name: CricketManiaAppRoute.fixturesScreen),
        builder: (_) => const FixturesScreen(),
      );

    case CricketManiaAppRoute.matchScoreCaredScreen:
      String? matchId;
      if (args is String) {
        matchId = args;
      }
      return MaterialPageRoute(
        settings: const RouteSettings(
            name: CricketManiaAppRoute.matchScoreCaredScreen),
        builder: (_) => MatchScorecardDetailsScreen(matchId: matchId!),
      );

    default:
      return null;
  }
}
