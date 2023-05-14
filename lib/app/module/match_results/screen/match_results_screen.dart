import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/match_results/controller/match_results_controller.dart';
import 'package:flutter/material.dart';

class MatchResultsScreen extends BasePageScreen {
  const MatchResultsScreen({Key? key}) : super(key: key);

  @override
  State<MatchResultsScreen> createState() => _MatchResultsScreenState();
}

class _MatchResultsScreenState extends BaseState<MatchResultsScreen> {
  final MatchResultsController _matchResultsController =
      MatchResultsController();

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Result"),
      centerTitle: true,
    );
  }

  @override
  bindControllers() {
    addControllers(_matchResultsController);
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
