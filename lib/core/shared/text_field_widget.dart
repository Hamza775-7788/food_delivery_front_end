import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const MyTextField({required this.controller, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.normalStyleTitle(),
      decoration: InputDecoration(
        hintStyle: AppStyles.subTitle(),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.colorScheme.primary),
        ),
      ),
    );
  }
}

class MyTextFieldWithLable extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String lable;
  const MyTextFieldWithLable({
    super.key,
    required this.controller,
    required this.hint,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: AppStyles.normalStyleTitle()),
        SizedBox(height: 10),
        MyTextField(controller: controller, hint: hint),
      ],
    );
  }
}
