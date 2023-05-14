import 'package:cricket_mania/app/utils/constants.dart';
import 'package:flutter/material.dart';

Widget buildErrorWidget(String errorMsg) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Center(
          child: Text(
            errorMsg,
            style: captionGrey,
          ),
        ),
      ),
    ],
  );
}
