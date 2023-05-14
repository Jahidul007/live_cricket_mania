import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/dashboard/data/model/series_response.dart';
import 'package:cricket_mania/app/module/widget/title_with_background.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:cricket_mania/app/utils/util_values.dart';
import 'package:cricket_mania/route/cricket_mania_app_route.dart';
import 'package:flutter/material.dart';

class RecentSeriesWidget extends StatelessWidget {
  final HomeController resultsController;

  const RecentSeriesWidget({Key? key, required this.resultsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: resultsController.seriesStream,
      builder: (context, AsyncSnapshot<SeriesResponse?> snapshot) {
        List<Results> results = [];
        if (snapshot.hasData && snapshot.data != null) {
          results = snapshot.data!.results!;
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWithBackground(title: "Series"),
              results.isNotEmpty
                  ? SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 1,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          children: List.generate(results.length, (index) {
                            return Card(
                              elevation: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      CricketManiaAppRoute.seriesScreen,
                                      arguments: results[index].series);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.orange)),
                                  child: Center(
                                    child: Text(
                                      results[index].type!.isNotEmpty
                                          ? getDisplayText(results[index].type)
                                          : "Others",
                                      style: body2regular.copyWith(
                                          color: primaryColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  : const Center(
                      child: Text("Currently there is no series"),
                    ),
              const SizedBox(height: 8),

              // const VSpacer(5),
            ],
          ),
        );
      },
    );
  }
}
