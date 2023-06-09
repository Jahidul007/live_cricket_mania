import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_mania/app/module/common/widget/custom_card.dart';
import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/widget/app_chip.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:cricket_mania/route/cricket_mania_app_route.dart';
import 'package:flutter/material.dart';

const double degreeToKmConstant = 0.2;

class FeaturedMatchesWidget extends StatefulWidget {
  final HomeController controller;

  const FeaturedMatchesWidget({
    super.key,
    required this.controller,
  });

  @override
  _FeaturedMatchesWidgetState createState() => _FeaturedMatchesWidgetState();
}

class _FeaturedMatchesWidgetState extends State<FeaturedMatchesWidget> {
  @override
  Widget build(BuildContext context) {
    return _getFeaturedMatchList();
  }

  Widget _getFeaturedMatchList() {
    return StreamBuilder(
      stream: widget.controller.fixturesMatchStream,
      builder: (context, AsyncSnapshot<MatchInfoResponse?> snapshot) {
        List<Results> results = [];
        if (snapshot.hasData && snapshot.data != null) {
          results = snapshot.data!.results!;
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Matches",
                    style: recentCardTitleStyle,
                  ),
                  RectangularChip(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CricketManiaAppRoute.fixturesScreen);
                    },
                    title: "View All",
                  )
                ],
              ),
              const SizedBox(height: 8),
              getCarouselWidget(results),
              getIndicatorWidget(results),
              // const VSpacer(5),
            ],
          ),
        );
      },
    );
  }

  CarouselController buttonCarouselController = CarouselController();
  final GlobalKey _globalKey = GlobalKey();

  getCarouselWidget(List<Results> results) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: results.isNotEmpty
          ? results.length == 1
              ? SizedBox(
                  height: 120,
                  child: CustomCardWidget(
                    results: results.first,
                  ),
                )
              : CarouselSlider(
                  key: _globalKey,
                  disableGesture: false,
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    initialPage: 0,
                    height: 130,
                    // viewportFraction: 0.90,
                    padEnds: false,
                    autoPlay: true,
                    onPageChanged: (value, reason) {
                      widget.controller.updateActivePage(value);
                    },
                  ),
                  items: List<Widget>.generate(
                    results.length,
                    (index) {
                      return CustomCardWidget(
                        results: results[index],
                      );
                    },
                  ),
                )
          : const Center(
              child: Text("There is no live Match"),
            ),
    );
  }

  getIndicatorWidget(List<Results> results) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        results.length,
        (index) {
          return StreamBuilder<int>(
            stream: widget.controller.activePage,
            builder: (context, snapshot) {
              int activePage = 0;
              if (snapshot.hasData) {
                activePage = snapshot.data!;
              }
              return Container(
                margin: const EdgeInsets.all(3),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                    color: activePage == index ? primaryColor : Colors.black26,
                    shape: BoxShape.circle),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // widget.controller.dispose();
    super.dispose();
  }
}
