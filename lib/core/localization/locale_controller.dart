import 'package:e_commerce_halfa/core/constants/apptheme.dart';
import 'package:e_commerce_halfa/core/functions/fcm_configuretion.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

//What is the LocaleController
//اساسا قاعدين نستخدمها عشان شنو ؟نغير الثيم بتاع التبطيق حسب اللغة المستخدمها
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
    requestPermistionNotification();
    fcmConfig();
    print("------------------------------------------");
    print("The controller is initialized");
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      lang = Locale("ar", "SA");
      appTheme = arabicTheme;
      Jiffy.setLocale("ar");
    } else if (sharedPrefLang == "en") {
      lang = Locale("en", "US");
      appTheme = englishTheme;
      Jiffy.setLocale("ar");
    } else {
      lang = Locale(
        Get.deviceLocale!.languageCode,
        Get.deviceLocale!.countryCode,
      );
      Jiffy.setLocale(Get.deviceLocale!.languageCode);
    }
    //Why did the course instructor put these in the locale controller?
    //Because of what?because of the local controller will be called just for the first time the app open then we will ask him
    //to give us permistion to  recive the notfication.
    //also to start dirctly listhing to the notfication  ...fcmConfig();
    //ما هو مش منطقي انو كل مرة التطبيق يفتح نسالو نقول ليهو يدين الاذن للاشعارات حنسالو مرة واحدة بس .اول مرة يفتح فيها  التطبيق .
    super.onInit();
  }
}
