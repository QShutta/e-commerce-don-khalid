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
  //Create var to track wither it's dark or not.
  bool isDarkmode = false;
  //الدالة دي وظيفتها واحدة: تختار أي ThemeData تستخدم اعتماداً على اللغة وDarkMode.

  // تخيل عندك "دولاب" فيه ٤ رفوف:
  // رف عربي Light
  // رف عربي Dark
  // رف إنجليزي Light
  // رف إنجليزي Dark
  // لمن المستخدم يغير اللغة…
  // أو يغير الثيم…
  // إنت لازم تمشي للدولاب دا وتجيب ليهو الرف الصحيح.
  // الدالة المسؤولة من الحتة دي:

  // This function updates the appTheme based on the current language and dark mode.
  // الدالة دي ببساطة وظيفتها تحدّد شكل التطبيق
  // (appTheme)
  //حسب اللغة ووضع الإضاءة.
  // If langCode == "ar", we switch between arabicTheme and arabicDarkTheme.
  // لو اللغة عربية:
  // لو isDark = true → نستخدم arabicDarkTheme، ولو false → arabicTheme.
  // If langCode == "en", we do the same but for the English themes.
  // نفس الفكرة لو اللغة إنجليزي
  //: dark → englishDarkTheme، light → englishTheme.
  void updateThemeData(String langCode, bool isDark) {
    if (langCode == "ar") {
      // Here we assign the appTheme value based on the selected language and dark mode state.
      // If langCode == "ar", we choose between arabicDarkTheme and arabicTheme.
      // The condition is simple: if isDark = true → arabicDarkTheme, otherwise → arabicTheme.
      appTheme = isDark ? arabicDarkTheme : arabicTheme;
    } else {
      appTheme = isDark ? englishDarkTheme : englishTheme;
    }
  }

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);

    // نغير التصميم حسب اللغة: لو عربي نستخدم arabicTheme، لو إنجليزي englishTheme
    appTheme = langCode == "ar" ? arabicTheme : englishTheme;
    //لمن نغير اللغة التطبيق لازم يختار اها اي ثيم عاوز لانو نحنا عندنا 4 ثيمات
    //arbiclight,arbicdark,englishligh,englishdark
    //فعشان كدة السطر دة بيحدد اي ثيم حيتم اختيارو بناء علي اللغة الاخترناها وبناء علي الثيم الاخترناهو
    updateThemeData(langCode, isDarkmode);
    // نحدث التصميم في كامل التطبيق
    Get.changeTheme(appTheme);
    //دة عشان يغير اللغة .
    Get.updateLocale(locale);

    //دة بيعيد بناء كل الواجهات الموجودة في التطبيق .
    Get.forceAppUpdate();
  }

  //I think this is the fucntion that will be used to switch between dark/light mode.
  //value of the "isDark" will came from the toogle in the user Ui
  changeThemeMode(bool isDark) {
    isDarkmode = isDark;
    //Why did we bring the currentselectedlang what is the benfit of this here?
    //تجيب currentLang من SharedPreferences (لو ما موجود → "en").
    //هذا مهم عشان تعرف أي لغة حالياً مختارة حتى تختار الثيم الصحيح (عربي/إنجليزي).
    String currentLang = myServices.sharedPreferences.getString("lang") ?? "en";

    myServices.sharedPreferences.setBool("isDarkMode", isDark);
    updateThemeData(currentLang, isDarkmode);
    Get.changeTheme(appTheme);
    // update();

    Get.forceAppUpdate();
  }

  @override
  void onInit() {
    requestPermistionNotification();
    fcmConfig();
    print("------------------------------------------");
    print("The controller is initialized");

    //بي دي احنا بنجيب الللغة التم اختيارها . وتم حفظها في الذاكرة بتاعت المستخدم .
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    String? langCode = sharedPrefLang ?? Get.deviceLocale!.languageCode;

    bool? sharedPrefTheme = myServices.sharedPreferences.getBool("isDarkMode");
    isDarkmode = sharedPrefTheme ?? false; // Default to light if null

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
    } // Set the initial theme based on both retrieved values
    updateThemeData(langCode, isDarkmode);
    //Why did the course instructor put these in the locale controller?
    //Because of what?because of the local controller will be called just for the first time the app open then we will ask him
    //to give us permistion to  recive the notfication.
    //also to start dirctly listhing to the notfication  ...fcmConfig();
    //ما هو مش منطقي انو كل مرة التطبيق يفتح نسالو نقول ليهو يدين الاذن للاشعارات حنسالو مرة واحدة بس .اول مرة يفتح فيها  التطبيق .
    super.onInit();
  }
}
