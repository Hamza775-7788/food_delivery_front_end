import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/view/sign_in_view.dart';
import 'package:food_delivery_front_end/core/theme/app_theme.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ligthTheme,
      debugShowCheckedModeBanner: false,
      home: SignInView(),
    );
  }
}
