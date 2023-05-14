import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/common/widget/custom_card.dart';
import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/widget/app_chip.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:cricket_mania/route/cricket_mania_app_route.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  final HomeController controller;

  const ResultsWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.matchResultsStream,
      builder: (context, AsyncSnapshot<MatchInfoResponse?> snapshot) {
        List<Results> results = [];
        if (snapshot.hasData && snapshot.data != null) {
          results = snapshot.data!.results!;
          if (results.isEmpty) {
            return const Center(child: Text("There is no data"));
          }
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Results",
                      style: recentCardTitleStyle,
                    ),
                  ),
                  RectangularChip(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CricketManiaAppRoute.resultsScreen,
                      );
                    },
                    title: "View All",
                  )
                ],
              ),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                itemCount: results.length >= 3 ? 3 : results.length,
                itemBuilder: (context, index) {
                  return CustomCardWidget(
                    results: results[index],
                  );
                },
                separatorBuilder: (context, index) => customHeight(),
              ),
            ],
          ),
        );
      },
    );
  }
}
