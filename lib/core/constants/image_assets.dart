// تم إنشاء هذا الكلاس لتجميع وحفظ جميع روابط
//(Paths)
// الصور المستخدمة في التطبيق.
// الهدف من ذلك هو تنظيم الكود وتقليل التكرار، بحيث إذا تغيّر مسار صورة معينة
// نعدّله فقط في هذا المكان بدلاً من البحث عنه في كل الملفات.
// هذا يُعتبر من أفضل ممارسات كتابة الكود
//(Best Practices)
// في المشاريع الكبيرة.

class ImageAssets {
  static const String onBoarding1 = 'assets/images/onboarding/on_board1.svg';
  static const String onBoarding2 = 'assets/images/onboarding/on_board2.svg';
  static const String onBoarding3 = 'assets/images/onboarding/on_board3.svg';
  static const String onBoarding4 = 'assets/images/onboarding/on_board4.svg';
  static const String signInImage = 'assets/images/auth/Login-amico.svg';
  static const String signUpImage = 'assets/images/auth/sign_up_amico.svg';
  static const String forgotPasswordEmailImage = 'assets/images/auth/email.svg';
  static const String forgotPasswordOtpImage = 'assets/images/auth/otp.svg';
  static const String resetPassowrd = 'assets/images/auth/reset_passowrd.svg';
  static const String successResetPass = 'assets/images/auth/success.svg';

  static const String forgotPasswordVerifiedImage =
      'assets/images/auth/verified.svg';
}
