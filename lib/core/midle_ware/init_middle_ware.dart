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
    bool? isLoggedIn = myServices.sharedPreferences.getBool("isLoggedIn");

    // First-time app open: No isFirstTime flag set yet
    if (isFirstTime == null) {
      return const RouteSettings(name: AppRoutes.languageSelection);
    }

    // After language and onboarding, isFirstTime is false, go to sign-in
    if (isFirstTime == false && isLoggedIn == null) {
      return const RouteSettings(name: AppRoutes.signIn);
    }

    // Already signed in, go to home
    if (isLoggedIn == true) {
      return const RouteSettings(name: AppRoutes.home);
    }

    // Default to sign-in if no other condition is met
    return const RouteSettings(name: AppRoutes.signIn);
  }
}
