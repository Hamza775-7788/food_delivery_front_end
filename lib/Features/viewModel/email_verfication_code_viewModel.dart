import 'package:flutter/material.dart';

class EmailVerficationCodeViewmodel {
  final String email;
  EmailVerficationCodeViewmodel({required this.email});
  String title = "Email verification";
  String get subTitle {
    return "Enter the verification code we send you on:\n$email";
  }

  String dontresvCodeLable = "Dont't receive the code?";
  String resendCodeLable = "Resend code";
  String verifyButtonLable = "Verify";
  late TextEditingController codeController;
  onVerify() {}
  onResend() {}
}
