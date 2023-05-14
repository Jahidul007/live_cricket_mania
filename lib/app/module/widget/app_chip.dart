import 'package:cricket_mania/app/utils/constants.dart';
import 'package:flutter/material.dart';

class RectangularChip extends StatefulWidget {
  final Function onTap;
  final String title;
  final IconData? iconData;

  final bool? selected;
  final bool selectable = false;

  const RectangularChip(
      {Key? key,
      required this.onTap,
      required this.title,
      this.iconData,
      this.selected = false})
      : super(key: key);

  @override
  _AppChipState createState() => _AppChipState();
}

class _AppChipState extends State<RectangularChip> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          border: widget.selected == true
              ? Border.all(color: const Color(0xFF496376).withOpacity(0.2))
              : Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(2),
          // color: widget.selected? Color(0xFF0070F7) : Colors.white,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: whiteBoldTag.copyWith(
              color: primaryColor,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
