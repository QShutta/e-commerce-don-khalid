// تم إنشاء هذا الكلاس لتجميع وحفظ جميع روابط
//(Paths)
// الصور المستخدمة في التطبيق.
// الهدف من ذلك هو تنظيم الكود وتقليل التكرار، بحيث إذا تغيّر مسار صورة معينة
// نعدّله فقط في هذا المكان بدلاً من البحث عنه في كل الملفات.
// هذا يُعتبر من أفضل ممارسات كتابة الكود
//(Best Practices)
// في المشاريع الكبيرة.

class ImageAssets {
  static const String loading = 'assets/images/data_states/loading.json';
  static const String noDataFound =
      'assets/images/data_states/no_data_found.json';
  static const String offline = 'assets/images/data_states/offline.json';
  static const String serverFailure =
      'assets/images/data_states/server_failure.json';
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

  static const String bannerMaknaZitFoulDon =
      'assets/images/home/banner_slider_images/مكنة_زيت_فول_الدون.png';
  static const String bannerJazmaDon =
      'assets/images/home/banner_slider_images/جزمة_الدون.png';
  static const String bannerDonTop2 =
      'assets/images/home/banner_slider_images/don_top2_gpt.png';
  static const String bannerDonTop1 =
      'assets/images/home/banner_slider_images/don_top1_gpt.png';
  static const String bannerDonSuite =
      'assets/images/home/banner_slider_images/don_suite.png';
  static const String bannerDonSdyre =
      'assets/images/home/banner_slider_images/don_sdyre.png';
  static const String bannerDonSandale =
      'assets/images/home/banner_slider_images/don_sandale.png';
  static const String bannerDonPerfume =
      'assets/images/home/banner_slider_images/don_perfume_gpt.png';
  static const String bannerDonJalabye =
      'assets/images/home/banner_slider_images/don_jalabye_gpt.png';
}
