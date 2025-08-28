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
  static const Color productImageBackgroundColor = Color.fromARGB(
    255,
    208,
    230,
    247,
  );

  static const Color greyText = Color(0xFF7A7A7A);
  static const Color primaryColor = Color(0xFF407BFF);
  static Color? grey800 = Colors.grey[800]!;
  static const Color black = Colors.black;
  static const Color begie = Color.fromARGB(255, 250, 234, 192);
  static const Color darkGrey = Color(0xFF333333);
}
