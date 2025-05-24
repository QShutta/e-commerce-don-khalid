// هذا الملف يحتوي على
//ThemeData
// مخصص لكل من اللغة الإنجليزية واللغة العربية.
// السبب في إنشاء هذا الملف هو أن الخطوط
//(Fonts)
//المستخدمة في اللغة العربية
// قد تختلف عن الخطوط المناسبة للغة الإنجليزية من ناحية الشكل أو الحجم أو الوضوح.
// بالإضافة لذلك، يمكن في المستقبل تخصيص ألوان أو تنسيقات مختلفة لكل لغة.
// وجود هذا الملف يسهل التحكم بمظهر التطبيق حسب اللغة النشطة،
// ويساعد في تحسين تجربة المستخدم
//(UX)
//عند التبديل بين اللغتين.

import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: "playFair",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.white70),
    labelLarge: TextStyle(fontSize: 16, color: Colors.white),
  ),
);

ThemeData arabicTheme = ThemeData(
  fontFamily: "cairo",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.white70),
    labelLarge: TextStyle(fontSize: 16, color: Colors.white),
  ),
);
