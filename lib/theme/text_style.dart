import 'package:flutter/material.dart';

TextStyle customTxtStyle(double size, Color color) {
  return TextStyle(
      fontFamily: "LouisGeorgeCafeBold", fontSize: size, color: color);
}

TextStyle customBoldTxtStyle(double size, Color color) {
  return TextStyle(
      fontFamily: "LouisGeorgeCafeBold",
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color);
}
