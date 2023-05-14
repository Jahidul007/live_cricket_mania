import 'package:flutter/material.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:cricket_mania/app/utils/constants.dart';

class ItemWithValue extends StatelessWidget {
  final String tag, value;
  final bool isTextAlign;
  final double fontSize;
  final TextStyle textStyle;

  const ItemWithValue(this.tag, this.value,
      {Key? key, this.isTextAlign = false, this.fontSize=14, this.textStyle = textNormalStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isTextAlign
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(tag, style: textNormal70Style.copyWith(fontSize: fontSize)),
          flex: 2,
        ),
         customWidth(width: 5),
        Flexible(
          child: Text(
            value,
            style: textStyle.copyWith(fontSize: fontSize),
            softWrap: true,
            textAlign: isTextAlign ? TextAlign.start : TextAlign.end,
          ),
          flex: 3,
        ),
      ],
    );
  }
}
