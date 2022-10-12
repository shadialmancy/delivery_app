import 'package:delivery_app/theme/text_style.dart';
import 'package:flutter/material.dart';

Widget customButton(VoidCallback function,
    {String label = '',
    Color color = Colors.black,
    double width = 0,
    double height = 0,
    Color colorText = Colors.white}) {
  return TextButton(
    onPressed: function,
    style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: color,
        fixedSize: Size(width, height)),
    child: Text(
      label,
      style: customTxtStyle(18, colorText),
    ),
  );
}
