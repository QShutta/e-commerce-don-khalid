import 'package:flutter/material.dart';

/// هذا الكلاس يحتوي على كل الألوان المستخدمة في التطبيق.
/// الهدف منه هو تنظيم الألوان وتوحيدها في مكان واحد.
/// بدلاً من كتابة
/// Colors.grey أو Color(0xFF407BFF)
/// في كل مكان،
/// نكتب
/// AppColor.grey أو AppColor.primary،
/// وده بيسهل التعديل لاحقًا.

class AppColor {
  /// لون الخلفية العامة للتطبيق
  static const Color whiteBackground = Color(0xFFF5F5F5);
  static const Color onboardingImageColor = Color(0xFF407BFF);
  static const Color whiteText = Colors.white;
  static const Color greyText = Color(0xFF7A7A7A);
  static const Color primaryColor = Color(0xFF407BFF);

  static const Color black = Colors.black;
}
