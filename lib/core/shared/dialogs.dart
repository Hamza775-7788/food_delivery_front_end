import 'package:flutter/material.dart';
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
    return Dialog(child: Container(child: Column(children: [Text(message)])));
  }
}
