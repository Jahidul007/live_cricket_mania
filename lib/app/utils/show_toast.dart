import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
  String msg, {
  Color backgroundColor = const Color(0xFFD3D3D3),
  Color textColor = const Color(0xff002540),
  Toast length = Toast.LENGTH_SHORT,
  ToastGravity gravity = ToastGravity.SNACKBAR,
}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    toastLength: length,
    gravity: gravity,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}
