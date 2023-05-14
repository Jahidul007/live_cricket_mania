import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/match_scorecard/controller/match_scorecard_controller.dart';
import 'package:cricket_mania/app/module/match_scorecard/data/model/match_scorecard_response.dart';
import 'package:cricket_mania/app/module/widget/custom_divider.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:cricket_mania/app/module/widget/item_with_value.dart';
import 'package:cricket_mania/app/module/widget/title_with_background.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:cricket_mania/app/utils/util_values.dart';
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

  getScoreBoard(List<Scorecard>? scorecard) {
    return scorecard != null
        ? ListView.separated(
            shrinkWrap: true,
            itemCount: scorecard.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index1) {
              return Column(
                children: [
                  TitleWithBackground(
                    title: "${scorecard[index1].title}",
                    subTitle:
                        "${scorecard[index1].runs}/${scorecard[index1].wickets}(${scorecard[index1].overs})",
                  ),
                  customHeight(),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ItemWithValue(
                          getDisplayText(
                              scorecard[index1].batting![index].playerName),
                          "${scorecard[index1].batting![index].runs}(${scorecard[index1].batting![index].balls})");
                    },
                    separatorBuilder: (context, index) =>
                        customHeight(height: 5),
                    itemCount: scorecard[index1].batting!.length,
                  ),
                  customHeight(),
                  const TitleWithBackground(title: "Bowling"),
                  customHeight(),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index2) {
                      return ItemWithValue(
                          getDisplayText(
                              "${scorecard[index1].bowling![index2].playerName}"),
                          "${scorecard[index1].bowling![index2].runsConceded}(${scorecard[index1].bowling![index2].overs})");
                    },
                    separatorBuilder: (context, index) =>
                        customHeight(height: 5),
                    itemCount: scorecard[index1].bowling!.length,
                  ),
                  customHeight(),
                  Text(
                    "Fow: ${scorecard[index1].fow}",
                    style: body2regular,
                  ),
                  customHeight()
                ],
              );
            },
            separatorBuilder: (context, index) => customDividerGrey(),
          )
        : const Center(
            child: Text("There is no Scorecard"),
          );
  }

  @override
  Widget body() {
    return StreamBuilder(
      stream: _scoreCardController.matchScorecardStream,
      builder: (context, snapshot) {
        MatchScorecardResponse? matchScorecardResponse;
        if (snapshot.hasData) {
          matchScorecardResponse = snapshot.data!;
        }
        return matchScorecardResponse != null
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getDisplayText(
                          matchScorecardResponse.results?.fixture?.matchTitle),
                      style: body2regular.copyWith(
                          color: primaryTextColor, fontSize: 12),
                    ),
                    customHeight(),
                    ItemWithValue(
                        getDisplayText(
                            "${matchScorecardResponse.results?.fixture?.home?.name}"),
                        getDisplayText(
                            "${matchScorecardResponse.results?.liveDetails?.matchSummary?.homeScores}")),
                    customHeight(),
                    ItemWithValue(
                        getDisplayText(
                            "${matchScorecardResponse.results?.fixture?.away?.name}"),
                        getDisplayText(
                            "${matchScorecardResponse.results?.liveDetails?.matchSummary?.awayScores}")),
                    customHeight(),
                    Text(
                      getDisplayText(
                          "${matchScorecardResponse.results?.liveDetails?.matchSummary?.status}"),
                      style: body2regular.copyWith(color: primaryColor),
                    ),
                    customDividerGrey(),
                    getScoreBoard(
                        matchScorecardResponse.results?.liveDetails?.scorecard),
                    customHeight(),
                  ],
                ),
              )
            : const Center(
                child: Text("Failed to find Match data"),
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
