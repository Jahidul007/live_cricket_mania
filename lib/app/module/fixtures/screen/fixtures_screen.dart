import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/common/widget/custom_card.dart';
import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/fixtures/controller/fixtures_controller.dart';
import 'package:cricket_mania/app/module/fixtures/screen/widget/fixtures_date_filter.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FixturesScreen extends BasePageScreen {
  const FixturesScreen({
    Key? key,
  }) : super(key: key);

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
      actions: [
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
             showFixturesFilter(
                context: context, fixturesController: _fixturesController);
          },
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: SvgPicture.asset(
                  "assets/images/ic_options.svg",
                  fit: BoxFit.fitHeight,
                ),
              )),
        ),
      ],
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
    return StreamBuilder(
      stream: _fixturesController.fixturesMatchStream,
      builder: (context, AsyncSnapshot<MatchInfoResponse?> snapshot) {
        List<Results> results = [];
        if (snapshot.hasData && snapshot.data != null && snapshot.data!.results!=null) {
          results = snapshot.data!.results!;
          if (results.isEmpty) {
            return const Center(child: Text("There is no data"));
          }
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
