import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_option_arabic.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_option_english.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_page_image.dart';
import 'package:e_commerce_halfa/view/widgets/on_boarding_page/language_page_widgets/language_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LanguageSelection extends GetView<LocaleController> {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    // LocaleController langCont = Get.find();
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
