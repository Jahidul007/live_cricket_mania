import 'package:cricket_mania/app/module/dashboard/screen/dashboard_screen.dart';
import 'package:cricket_mania/app/module/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


abstract class CricketManiaAppRoute {
  static const String splash = "/splash";

  static const String homeScreen = '/homeScreen';
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

    default:
      return null;
  }
}
