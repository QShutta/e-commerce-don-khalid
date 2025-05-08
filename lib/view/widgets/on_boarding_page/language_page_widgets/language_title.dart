import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class LanguageTitle extends StatelessWidget {
  const LanguageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: const Text(
        "CHOOSE YOUR LANGUAGE",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
