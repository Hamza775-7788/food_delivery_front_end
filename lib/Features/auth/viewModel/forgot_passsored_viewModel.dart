import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class ForgotPasssoredViewmodel {
  String title = "Forgot Password?";
  String subTitle =
      "Enter your email address and we’ll send you \nconfirmation code to reset your password";

  String emailLable = "Email Address";
  String emailHint = "Albertstevano@gmail.com";
  String forgotButtonLable = "Continue";
  late TextEditingController emailController;
  AuthControllerImpl _controllerImpl = Get.put(AuthControllerImpl());
  onForgot() {
    if (emailController.text.isEmpty) {
    } else {
      _controllerImpl.forgotePassowrd(email: emailController.text);
    }
  }
}
