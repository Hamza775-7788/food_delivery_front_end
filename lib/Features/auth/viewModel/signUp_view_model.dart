import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignupViewModel {
  String title = "Create your new \naccount";
  String subTitle =
      "Create an account to start looking for the food you \nlike";
  String emailLable = "Email Address";
  String emailHint = "Albertstevano@gmail.com";
  String passwordLable = "Password";
  String passwordHint = "*********";
  String userNameLable = "User Name";
  String userNameHint = "Albertstevano";

  String iAgreeLable = "I agree to the terms and conditions";

  bool iAgree = false;
  AuthControllerImpl _controllerImpl = Get.put(AuthControllerImpl());
  String regestrButtonLable = "Register";
  String signInLable = "Sign In";
  String readyToSignInLable = "Already have an account?";
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  onSignUp() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        userNameController.text.isEmpty) {
      Get.snackbar("", "يجب ادخال جميع البينات");
    } else {
      _controllerImpl.signUp(
        email: emailController.text,
        passowrd: passwordController.text,
        userName: userNameController.text,
      );
    }
  }

  onSignIn() {
    Get.back();
  }

  onTermsAndConditions() {
    iAgree = !iAgree;
  }
}
