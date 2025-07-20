import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class MyGenralButton extends StatelessWidget {
  final String name;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  const MyGenralButton({
    super.key,
    this.backgroundColor,
    this.textColor,
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
          color: backgroundColor ?? Get.theme.colorScheme.primary,
        ),
        child: Text(
          name,
          style: AppStyles.normalStyleTitle(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}

class AppBarButtonWithIcon extends StatelessWidget {
  const AppBarButtonWithIcon({required this.icon, this.onTp, super.key});
  final Widget icon;
  final Function()? onTp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTp,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: icon,
      ),
    );
  }
}
