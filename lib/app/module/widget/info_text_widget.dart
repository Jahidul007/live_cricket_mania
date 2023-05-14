import 'package:flutter/material.dart';
import 'package:cricket_mania/app/utils/constants.dart';

import 'custom_height_width.dart';

class InfoTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoTextWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: pageHeadingStyle,
          textAlign: TextAlign.center,
        ),
        customHeight(height: 10),
        Text(
          subtitle,
          style: textSubHeadingStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
