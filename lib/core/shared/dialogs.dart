import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/constant/image.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class LodingDialog extends StatelessWidget {
  const LodingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(100),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

lodingDialog() {
  Get.dialog(barrierDismissible: false, LodingDialog());
}

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.theme.colorScheme.surface,
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("حطاء في العملية", style: AppStyles.normalStyleTitle()),
            const SizedBox(height: 16),
            Image.asset(AppIcons.erorrIcon, height: 50),
            const SizedBox(height: 16),

            Text(message, style: AppStyles.normalStyleTitle()),
            const SizedBox(height: 16),

            MyGenralButton(
              onPressed: () {
                Get.back();
              },
              name: "اغلاق",
            ),
          ],
        ),
      ),
    );
  }
}
