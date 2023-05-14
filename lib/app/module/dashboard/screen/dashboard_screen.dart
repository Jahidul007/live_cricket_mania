import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/dashboard/data/enum/menu_item_type.dart';
import 'package:cricket_mania/app/module/dashboard/screen/widget/featured_match/featured_matches_widget.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widget/results/results_widget.dart';
import 'widget/series/recent_series_widget.dart';

class HomeScreen extends BasePageScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  getAllData() async {
    String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    await _homeController.getFixturesMatches(dateTime: currentDate);
    await _homeController.getSeries();
    await _homeController.getMatchResults();
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text('Live Cricket'),
      centerTitle: true,
    );
  }

  @override
  bindControllers() {
    addControllers(_homeController);
  }

  @override
  Widget body() {
    return StreamBuilder<MenuItemType>(
      stream: _homeController.menuItemStream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              FeaturedMatchesWidget(
                controller: _homeController,
              ),
              customHeight(),
              RecentSeriesWidget(
                resultsController: _homeController,
              ),
              customHeight(),
              ResultsWidget(
                controller: _homeController,
              ),
            ],
          ),
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
