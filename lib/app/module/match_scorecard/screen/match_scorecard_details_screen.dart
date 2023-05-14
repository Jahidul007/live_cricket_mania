import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/match_scorecard/controller/match_scorecard_controller.dart';
import 'package:flutter/material.dart';

class MatchScorecardDetailsScreen extends BasePageScreen {
  final String matchId;

  const MatchScorecardDetailsScreen({Key? key, required this.matchId})
      : super(key: key);

  @override
  State<MatchScorecardDetailsScreen> createState() =>
      _MatchScorecardDetailsScreenState();
}

class _MatchScorecardDetailsScreenState
    extends BaseState<MatchScorecardDetailsScreen> {
  final MatchScoreCardController _scoreCardController =
      MatchScoreCardController();

  @override
  void initState() {
    super.initState();
    _scoreCardController.getMatchScorecard(widget.matchId);
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Scorecard"),
      centerTitle: true,
    );
  }

  @override
  bindControllers() {
    addControllers(_scoreCardController);
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
