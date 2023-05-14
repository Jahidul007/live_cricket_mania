import 'package:cricket_mania/app/utils/constants.dart';
import 'package:flutter/material.dart';

class AppButtonSmall extends StatelessWidget {
  final Function() onPressed;
  final String? title;
  final Color borderColor;
  final Color titleColor;
  final double height;
  final double borderRadius;
  final Color bodyColor;

  AppButtonSmall({
    Key? key,
    required this.onPressed,
    this.title,
    this.borderColor = lightGreyColor,
    this.titleColor = const Color(0xff496376),
    this.bodyColor = Colors.white,
    this.height = 42,
    this.borderRadius = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      disabledColor: lightGreyColor,
      height: height,
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
          )),
      color: bodyColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title ?? "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: titleColor,
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
