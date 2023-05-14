import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:cricket_mania/app/module/common/controller/fixtures_match_controller.dart';
import 'package:cricket_mania/app/module/common/controller/series_mixin.dart';
import 'package:cricket_mania/app/module/dashboard/data/enum/menu_item_type.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends BaseController
    with SeriesMixin, FixturesMatchesMixin {
  final BehaviorSubject<MenuItemType> _menuItemController =
      BehaviorSubject<MenuItemType>.seeded(MenuItemType.topUserByCountry);

  Stream<MenuItemType> get menuItemStream => _menuItemController.stream;

  updateMenuItem(MenuItemType menuItemType) {
    _menuItemController.sink.add(menuItemType);
  }

  @override
  void dispose() {
    _menuItemController.close();
    super.dispose();
  }
}
