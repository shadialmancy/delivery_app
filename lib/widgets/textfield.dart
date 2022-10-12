import 'package:delivery_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/theme/colors.dart';

Widget customSearchTextField(
    {String hint = "", VoidCallback? onPressed, bool enabled = true}) {
  return TextField(
    onTap: onPressed,
    autofocus: true,
    enabled: enabled,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: black.withOpacity(0.3)),
        hintText: hint,
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: black.withOpacity(0.2),
        )),
  );
}

Widget customTextField(TextEditingController controller,
    {Icon? icon,
    String hintText = "",
    bool isSecure = false,
    Function? validator,
    TextInputType textType = TextInputType.text}) {
  return TextFormField(
    controller: controller,
    obscureText: isSecure,
    keyboardType: textType,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      return validator!();
    },
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: customTxtStyle(18, black.withOpacity(0.3)),
      filled: true,
      fillColor: black.withOpacity(0.03),
      prefixIcon: icon,
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
      errorBorder: customBorder(Colors.red),
    ),
  );
}

InputBorder customBorder(Color color) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 0.5),
      borderRadius: BorderRadius.circular(20));
}


/*TYPES OF VALIDATION

FOR EMAIL () {
              
              if (emailController.text.isEmpty) {
                return 'Can\'t be empty';
              }
              if (!emailController.text.contains("@") ||
                  !emailController.text.contains(".com")) {
                return 'Invalid email';
              }
              return null;
            },

FOR PASSWORD () {
              String text1 = passwordController.text;
              String text2 = checkPasswordController.text;
              if (text1.isEmpty) {
                return 'Can\'t be empty';
              }
              if (text1.length < 8) {
                return 'Password too short. minimum required 8';
              }
              if (text1 != text2) {
                return 'Password doesn\'t match';
              }
              return null;
            },



*/
