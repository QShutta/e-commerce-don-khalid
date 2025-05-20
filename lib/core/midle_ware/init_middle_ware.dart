import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    bool? isFirstTime = myServices.sharedPreferences.getBool("isFirstTime");

    if (isFirstTime != null || isFirstTime == false) {
      return const RouteSettings(name: AppRoutes.signIn);
    }

    // مش أول مرة، نوديه لتسجيل الدخول
    return null; // Return null if no other condition is met
  }
}
