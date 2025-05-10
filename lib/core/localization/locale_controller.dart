import 'dart:ui';

import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocaleController extends GetxController {
  Locale? lang;
  MyServices myServices = Get.find();

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    print("------------------------------------------");
    print("The controller is initialized");
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      lang = Locale("ar", "SA");
    } else if (sharedPrefLang == "en") {
      lang = Locale("en", "US");
    } else {
      lang = Locale(
        Get.deviceLocale!.languageCode,
        Get.deviceLocale!.countryCode,
      );
    }
    super.onInit();
  }
}
