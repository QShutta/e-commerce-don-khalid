import 'package:e_commerce_halfa/bindings/inital_binding.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:e_commerce_halfa/core/localization/translation.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/routest.dart';
import 'package:e_commerce_halfa/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

//Before of try to add rating to the product it self
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ✅ تهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Firebase.initializeApp(); // Use default config from google-services.json
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
      theme: langCont.appTheme,
      locale: langCont.lang,
      translations: MyTranslation(),
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      // home: TestPage(),
      initialRoute: AppRoutes.languageSelection,
      getPages: appPages,
    );
  }
}
