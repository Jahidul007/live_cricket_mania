import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/common/widget/custom_card.dart';
import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/match_results/controller/match_results_controller.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
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
  void initState() {
    super.initState();
    _matchResultsController.getMatchResults();
  }

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
    return StreamBuilder(
      stream: _matchResultsController.matchResultsStream,
      builder: (context, AsyncSnapshot<MatchInfoResponse?> snapshot) {
        List<Results> results = [];
        if (snapshot.hasData && snapshot.data != null) {
          results = snapshot.data!.results!;
          if (results.isEmpty) {
            return const Center(child: Text("There is no data"));
          }
        }

        return ListView.separated(
          padding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: results.length,
          itemBuilder: (context, index) {
            return CustomCardWidget(
              results: results[index],
            );
          },
          separatorBuilder: (context, index) => customHeight(),
        );
      },
    );
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
