import 'package:flutter/material.dart';
import 'package:cricket_mania/app/utils/constants.dart';

class AppButtonSmallFocused extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final double radiusValue;

  const AppButtonSmallFocused(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.radiusValue = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 12,
            bottom: 12,
          ),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusValue),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button?.copyWith(
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
