import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:cricket_mania/app/module/dashboard/controller/home_controller.dart';
import 'package:cricket_mania/app/module/dashboard/data/enum/menu_item_type.dart';

/*showPopUpMenu(BuildContext context, Offset offset) async {
  final screenSize = MediaQuery.of(context).size;
  double left = offset.dx;
  double top = offset.dy;
  double right = screenSize.width - offset.dx;
  double bottom = screenSize.height - offset.dy;

  await showMenu<HelpSupportType>(
    context: context,
    position: RelativeRect.fromLTRB(left, top, right, bottom),
    items: HelpSupportType.values
        .map((HelpSupportType helpSupportType) =>
        PopupMenuItem<HelpSupportType>(
          value: helpSupportType,
          child: Text(getHelpSupportString(helpSupportType)),
        ))
        .toList(),
  ).then((HelpSupportType period) {
    if (period == HelpSupportType.TROUBLE_SHOOTING) {
      Navigator.of(context).pushNamed(
        CoreRoutes.troubleShootScreen,
      );
    }

    if (period == HelpSupportType.FAQ) {
      Navigator.of(context).pushNamed(
        CoreRoutes.frequentlyAskQuestionScreen,
      );
    }
  });
}*/
