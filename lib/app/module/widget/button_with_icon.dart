import 'package:flutter/material.dart';

import 'package:cricket_mania/app/utils/constants.dart';

class ButtonWithIcon extends StatelessWidget {
  final String icon;
  final String title;
  final double radius;
  final Function() onTap;

  const ButtonWithIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.radius = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
        backgroundColor:
            MaterialStatePropertyAll(primaryColor.withOpacity(0.2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      icon: Image.asset(
        icon,
        color: greyBorderColor,
        width: 16,
        height: 16,
      ),
      label: Text(
        title,
        style: body2regular,
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
