import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle normalStyleTitle({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400
    );
  }
  static TextStyle normalStyleTitleBold({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.bold
    );
  }
  static TextStyle textFieldStyel({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w400
    );
  }


}
