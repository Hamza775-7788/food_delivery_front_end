import 'package:flutter/widgets.dart';
import 'package:food_delivery_front_end/Features/view/forgote_passowrd_view_page.dart';
import 'package:food_delivery_front_end/Features/view/sign_up_viewPage.dart';
import 'package:get/get.dart';

class SignInViewmodel {
  String title = "Login to your\naccount.";
  String subTitle = "Please sign in to your account ";
  String emailLable = "Email Address";
  String passwordLable = "Password";
  String emailHint = "Albertstevano@gmail.com";
  String passwordHint = "**********";
  String fotgotLable = "Forgot password?";
  String signInLable = "Sign In";
  String signUpLable = " Register";
  String dontRegestr = "Don't have an account?";
  String orLable = "Or sign in with";

  late TextEditingController emailController;
  late TextEditingController passwordController;

  onSignIn() {}

  onForgot() {
    // Navigate to forgot password page

    Get.to(
      () => ForgotePassowrdViewPage(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  onSignUp() {
    // Navigate to sign up page

    Get.to(
      () => SignUpViewPage(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }
}
