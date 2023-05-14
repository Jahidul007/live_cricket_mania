import 'package:flutter/material.dart';

showSnackBar(GlobalKey<ScaffoldState> globalKey, String msg){
  ScaffoldMessenger.of(globalKey.currentState!.context).showSnackBar(SnackBar(
    content: Text(msg),
  ));
}