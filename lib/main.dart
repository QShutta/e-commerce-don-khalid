import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:e_commerce_halfa/core/localization/translation.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/routest.dart';
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
      theme: langCont.appTheme,
      locale: langCont.lang,
      // locale: Locale("en"),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      // home: SuccessSignUpPage(),
      getPages: appPages,
    );
  }
}
