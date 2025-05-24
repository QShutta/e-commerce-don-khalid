import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//
class SignHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double height;
  final String? imagePath;

  const SignHeader({
    super.key,
    required this.title,
    required this.imagePath,
    required this.height,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
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
          SizedBox(
            height: 130,
            width: 130,
            child: SvgPicture.asset(imagePath!, height: 100),
          ),
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 5),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
