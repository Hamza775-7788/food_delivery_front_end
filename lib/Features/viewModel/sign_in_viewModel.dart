import 'package:flutter/widgets.dart';
import 'package:food_delivery_front_end/Features/controller/auth_controller.dart';
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

  AuthControllerImpl _controllerImpl = Get.put(AuthControllerImpl());
  onSignIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    } else {
      await _controllerImpl.signIn(
        email: emailController.text,
        passowrd: passwordController.text,
      );
    }
  }

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
