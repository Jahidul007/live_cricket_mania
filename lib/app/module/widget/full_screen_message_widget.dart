import 'package:cricket_mania/app/utils/util_values.dart';
import 'package:flutter/material.dart';
import 'package:cricket_mania/app/utils/constants.dart';

class FullScreenMessageWidget extends StatelessWidget {
  final String? message;

  const FullScreenMessageWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            getDisplayText(message),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
