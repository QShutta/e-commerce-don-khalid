import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:e_commerce_halfa/core/localization/translation.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/routest.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initlizeServices();

  // Put LocaleController after services are ready
  Get.put(LocaleController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // No need to put controller here again
    LocaleController langCont = Get.find();

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "playFair",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
          bodySmall: TextStyle(fontSize: 14, color: Colors.white70),
          labelLarge: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      locale: langCont.lang,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      // home: SignInPage(),
      getPages: appPages,
    );
  }
}
