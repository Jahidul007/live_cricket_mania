import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/dashboard/data/enum/menu_item_type.dart';

showMenuDialog(BuildContext context, HomeController homeController) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Filter'),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.cancel_outlined),
            )
          ],
        ),
        actions: [
          StreamBuilder<MenuItemType>(
            stream: homeController.menuItemStream,
            builder: (context, snapshot) {
              MenuItemType menuItemType = MenuItemType.topRepositories;
              if (snapshot.hasData) {
                menuItemType = snapshot.data!;
              }
              return Column(
                children: [
                  DropdownSearch<MenuItemType>(
                    enabled: true,
                    items: MenuItemType.values,
                    selectedItem: menuItemType,
                    itemAsString: (item) => getMenuItemAsString(item),
                    onChanged: (value) {
                      homeController.updateMenuItem(value!);
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        label: Text('Search By'),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                ],
              );
            },
          ),
        ],
      );
    },
  );
}
