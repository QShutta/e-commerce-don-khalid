import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        "52".tr,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColor.greyText,
        ),
      ),
    );
  }
}
