import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // هنا تكتب أي كود تسجيل خروج إذا عندك، ثم توجه لصفحة التسجيل
              Get.offAllNamed(
                AppRoutes.signIn,
              ); // لازم تكون معرف الراوت '/signin' في GetMaterialApp

              MyServices myServices = Get.find();
              await myServices.sharedPreferences.setBool("isLoggedIn", false);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to the Home Screen",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
