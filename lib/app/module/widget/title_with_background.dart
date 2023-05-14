import 'package:flutter/material.dart';
import 'package:cricket_mania/app/utils/constants.dart';

class TitleWithBackground extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Color? bgColor;
  final double? radius;

  const TitleWithBackground({
    Key? key,
    required this.title,
    this.subTitle,
    this.bgColor = primaryColor,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: body2regular,
            textAlign: TextAlign.start,
          ),
          Text(
            subTitle??'',
            style: body2regular,
            textAlign: TextAlign.start,
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: bgColor?.withOpacity(0.2)),
    );
  }
}
