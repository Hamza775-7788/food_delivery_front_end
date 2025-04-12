import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class MyGenralButton extends StatelessWidget {
  final String name;
  final Function() onPressed;
  const MyGenralButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Get.theme.colorScheme.primary,
        ),
        child: Text(
          name,
          style: AppStyles.normalStyleTitle(color: Colors.white),
        ),
      ),
    );
  }
}
