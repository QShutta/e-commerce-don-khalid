import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_option_arabic.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_option_english.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_page_image.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_title.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          LanguagePageImage(),
          const SizedBox(height: 100),
          LanguageTitle(),
          const SizedBox(height: 20),
          LanguageOptionArabic(),
          SizedBox(height: 20),
          LanguageOptionEnglish(),
        ],
      ),
    );
  }
}
