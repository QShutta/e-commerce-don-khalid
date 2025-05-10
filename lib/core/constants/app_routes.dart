class AppRoutes {
  static const String signIn = '/signIn';

  /// ❗️استخدمنا "/" كشاشة البداية في التطبيق.
  /// - لأن "/" هو المسار الافتراضي
  /// (default route) في Flutter.
  /// - أول ما التطبيق يشتغل، بيبدأ بالشاشة اللي مرتبطة بـ "/".
  /// - وده بنحددو في
  /// `initialRoute: "/"`
  /// داخل
  /// `GetMaterialApp`.
  ///
  /// في حالتنا دي، شاشة الـ
  /// Onboarding
  /// هي أول شاشة عاوزين المستخدم يشوفها،
  /// عشان كده ربطناها بالـ "/".
  static const String onBoarding = '/onBoarding';
  static const String languageSelection = '/';
}
