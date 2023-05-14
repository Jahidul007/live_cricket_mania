import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget logoWidget(BuildContext context) {
  return SvgPicture.asset(
    "images/logo-with-text.svg",
    width: 220,
    color: Theme.of(context).primaryColor,
  );
}