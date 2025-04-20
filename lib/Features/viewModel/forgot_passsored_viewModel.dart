import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/view/emial_verifiyCodeViewPage.dart';
import 'package:get/get.dart';

class ForgotPasssoredViewmodel {
  String title = "Forgot Password?";
  String subTitle =
      "Enter your email address and we’ll send you \nconfirmation code to reset your password";

  String emailLable = "Email Address";
  String emailHint = "Albertstevano@gmail.com";
  String forgotButtonLable = "Continue";
  late TextEditingController emailController;

  onForgot() {
    Get.to(
      () => EmialVerifiycodeviewpage(email: emailController.text),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }
}
