import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/dashboard/data/enum/menu_item_type.dart';
import 'package:cricket_mania/app/module/dashboard/screen/widget/featured_match/featured_matches_widget.dart';
import 'package:flutter/material.dart';
import 'widget/menu_item_widget.dart';

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
    _homeController.getFixturesMatches();
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text('Cricket Mania Live'),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showMenuItems();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  showMenuItems() {
    return showMenuDialog(context, _homeController);
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
