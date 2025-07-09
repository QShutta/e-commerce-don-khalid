class AppLinkApi {
  static const String serverUrl =
      "https://qasimshutta.shop/2test/e-commerce-halfa";
  static const String test = "$serverUrl/test.php";

  //--------------------------------Auth======================================
  static const String signUpLink = "$serverUrl/auth/signup.php";
  static const String signUpOtpLink = "$serverUrl/auth/varfy_code.php";
  static const String signInLink = "$serverUrl/auth/sign_in.php";
  static const String checkEmailReset =
      "$serverUrl/auth/forgot_password/check_email.php";
  static const String verfyCodeReset =
      "$serverUrl/auth/forgot_password/verfy_code_reset.php";
  static const String resetPassword =
      "$serverUrl/auth/forgot_password/reset_password.php";
  static const String homePage = "$serverUrl/home.php";
}
