import 'package:e_commerce_halfa/core/localization/translation.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/routest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//befor of watch the lesson num 10.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initlizeServices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale("ar"),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: routes,
    );
  }
}
