import 'package:flutter/material.dart';

class LanguagePageImage extends StatelessWidget {
  const LanguagePageImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Image.asset(
        "assets/images/onboarding/lang.png",
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
