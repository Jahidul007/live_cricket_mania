enum MenuItemType { topUserByCountry, topRepositories }

String getMenuItemAsString(MenuItemType type) {
  switch (type) {
    case MenuItemType.topUserByCountry:
      return "Top User By Country";
    case MenuItemType.topRepositories:
      return "Top Repositories";
    default:
      return "";
  }
}
