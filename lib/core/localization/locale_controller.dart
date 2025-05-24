import 'package:e_commerce_halfa/core/constants/apptheme.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? lang;
  MyServices myServices = Get.find();

  ThemeData appTheme = englishTheme;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    print("------------------------------------------");
    print("The controller is initialized");
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      lang = Locale("ar", "SA");
      appTheme = arabicTheme;
    } else if (sharedPrefLang == "en") {
      lang = Locale("en", "US");
      appTheme = englishTheme;
    } else {
      lang = Locale(
        Get.deviceLocale!.languageCode,
        Get.deviceLocale!.countryCode,
      );
    }
    super.onInit();
  }
}
