import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ),
      onPressed: onPressed,
      child: Text(
        "9".tr,
        // "Next".tr, // Next button text in Arabic
        // "التالي".tr, // Next button text in Arabic
        style: TextStyle(
          fontSize: 16,
          fontFamily: "Tajawal",
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
