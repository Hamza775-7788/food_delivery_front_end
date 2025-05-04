import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/controller/auth_controller.dart';
import 'package:get/get.dart';

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

  AuthControllerImpl _controllerImpl = Get.put(AuthControllerImpl());
  onVerify() {
    if (codeController.text.isEmpty) {
    } else {
      _controllerImpl.verifiyCode(email: email, code: codeController.text);
    }
  }

  onResend() {}
}
