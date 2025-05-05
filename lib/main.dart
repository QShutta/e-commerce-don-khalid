import 'package:e_commerce_halfa/routest.dart';
import 'package:e_commerce_halfa/view/screens/onboarding.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: routes,
    );
  }
}
