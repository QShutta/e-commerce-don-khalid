import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessSignUpHeader extends StatelessWidget {
  // final String title;
  // final String subtitle;
  // final String buttonText;
  // final VoidCallback onPressed;
  final Color? backgroundColor;
  final double height;
  final String? imagePath;

  const SuccessSignUpHeader({
    super.key,
    // required this.title,
    required this.imagePath,
    required this.height,
    // required this.subtitle,
    // required this.buttonText,
    // required this.onPressed,
    this.backgroundColor = const Color(
      0xFF3B5998,
    ), // افتراضي لو ما تم تمرير لون
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(color: backgroundColor),
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          Center(
            child: SvgPicture.asset(
              imagePath!,
              height: 350,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
