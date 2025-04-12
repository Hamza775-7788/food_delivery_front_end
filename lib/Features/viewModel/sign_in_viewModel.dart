import 'package:flutter/widgets.dart';

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

  onForgot() {}

  onSignUp() {}
}
