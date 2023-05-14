import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/series/controller/series_controller.dart';
import 'package:flutter/material.dart';

class SeriesScreen extends BasePageScreen {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends BaseState<SeriesScreen> {
  final SeriesController _seriesController = SeriesController();

  @override
  void initState() {
    super.initState();
    _seriesController.getSeries();
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Series"),
      centerTitle: true,
    );
  }

  @override
  bindControllers() {
    addControllers(_seriesController);
  }

  @override
  Widget body() {
    return Container();
  }

  @override
  Widget? floatingActionButton() {
    return null;
  }

  @override
  void onClickBackButton() {}

  @override
  Color? pageBackgroundColor() {
    return null;
  }
}
