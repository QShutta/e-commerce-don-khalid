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

    // ✋ أول مرة يفتح المستخدم التطبيق، قيمة
    //isFirstTime بتكون null.
    // لازم نوجه المستخدم لصفحة اختيار اللغة.
    // لكن لو المستخدم حالياً في صفحة اختيار اللغة نفسها، بدون الشرط الثاني، حتكون دالة
    //redirect
    // ترجع توجيه لنفس الصفحة باستمرار.
    // هذا يسبب حلقة توجيه لا نهائية
    //(redirect loop).
    // النتيجة: يظهر الخطأ التالي في سجل
    // GETX:
    // [GETX] Redirect to RouteSettings("/", null)
    // عشان كدا نضيف الشرط الثاني
    //(route != AppRoutes.languageSelection)
    // عشان نمنع إعادة التوجيه للصفحة نفسها ونكسر الحلقة.
    // ✅ أول مرة يفتح التطبيق
    if (isFirstTime == null && route != AppRoutes.languageSelection) {
      return const RouteSettings(name: AppRoutes.languageSelection);
    }

    // ✅ خلص اختيار اللغة والـ onboarding ولسه ما سجل دخول
    if (isFirstTime == false &&
        isLoggedIn != true &&
        route != AppRoutes.signIn) {
      return const RouteSettings(name: AppRoutes.signIn);
    }

    // ✅ لو مسجل دخول قبل كدا
    if (isLoggedIn == true && route != AppRoutes.home) {
      return const RouteSettings(name: AppRoutes.home);
    }

    // ❌ ما تعمل redirect لنفس الصفحة
    return null;
  }
}
