import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  static TextStyle normalStyleTitle({Color? color}) {
    return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w600);
  }

  static TextStyle bigTitle({Color? color}) {
    return TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  }

  static TextStyle subTitle({double? size}) {
    return TextStyle(
      fontSize: size ?? 12,
      fontWeight: FontWeight.bold,
      color: Get.theme.colorScheme.secondary,
    );
  }

  static TextStyle normalStyleTitleBold({Color? color}) {
    return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle textFieldStyel({Color? color}) {
    return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400);
  }
}
