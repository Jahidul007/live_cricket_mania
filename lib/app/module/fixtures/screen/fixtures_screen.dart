import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/fixtures/controller/fixtures_controller.dart';
import 'package:flutter/material.dart';

class FixturesScreen extends BasePageScreen {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends BaseState<FixturesScreen> {
  final FixturesController _fixturesController = FixturesController();

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Fixtures"),
      centerTitle: true,
    );
  }

  @override
  bindControllers() {
    addControllers(_fixturesController);
  }

  @override
  void initState() {
    super.initState();
    _fixturesController.getFixturesMatches();
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
  void onClickBackButton() {
  }

  @override
  Color? pageBackgroundColor() {
    return null;

  }
}
