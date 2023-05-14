
import 'package:cricket_mania/route/cricket_mania_app_route.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {

    MaterialPageRoute? page;

    page = getCricketManiaAppRoutes(settings);
    if (page != null) return page;


    return page; //todo this might cause error
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
