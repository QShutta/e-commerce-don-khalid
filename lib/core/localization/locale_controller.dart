import 'package:e_commerce_halfa/core/constants/apptheme.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? lang;
  MyServices myServices = Get.find();

  //دة المتغير  اللى هنستخدمه عشان نغير تصميم التطبيق حسب اللغة
  // لو اللغة عربية هنستخدم تصميم معين، ولو إنجليزي هنستخدم تصميم تاني

  ThemeData appTheme = englishTheme;
  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);

    // نغير التصميم حسب اللغة: لو عربي نستخدم arabicTheme، لو إنجليزي englishTheme
    appTheme = langCode == "ar" ? arabicTheme : englishTheme;

    // نحدث التصميم في كامل التطبيق
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
