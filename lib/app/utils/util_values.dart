import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color getRandomColor(int opacity){
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(opacity/100);
}

String getDisplayText(String? value){
  if(value == null || value.isEmpty || value == "null"){
    return "N/A";
  }
  return value;
}

String defaultIfNull(String? value){
  if(value == null || value.isEmpty || value == "null"){
    return "";
  }
  return value;
}


NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");

getDoubleToFixedLength(dynamic value) {
  if (value == null) {
    return "0.0";
  }
  return numberFormat.format(double.parse(value.toString())).toString();
}

getCurrencyValueInDouble(dynamic value){
  if (value == null) {
    return "0.0";
  }
  return double.parse(value.replaceAll("\$", "").replaceAll(",", ""));
}

const DEFAULT_VALUE = 0.0;
extension DoubleValue on double{
  toStringAsFixedTwo() => getDoubleToFixedLength(this) ?? DEFAULT_VALUE;
}