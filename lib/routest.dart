import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/midle_ware/init_middle_ware.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passord_reset_password_success_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_password_email_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_password_otp_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_password_reset_password_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_in_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_up_page.dart';
import 'package:e_commerce_halfa/view/screens/language_selection.dart';
import 'package:e_commerce_halfa/view/screens/onboarding.dart';
import 'package:get/get.dart';

List<GetPage> appPages = [
  GetPage(
    name: AppRoutes.languageSelection,
    page: () => LanguageSelection(),
    middlewares: [InitMiddleware()],
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => Onboarding(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.signIn,
    page: () => SignInPage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => SignUpPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
  ),

  // 🔐 Forgot Password Flow
  GetPage(
    name: AppRoutes.forgotPasswordEmail,
    page: () => ForgotPasswordEmailPage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.forgotPasswordOtp,
    page: () => ForgotPasswordOtpPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),

  GetPage(
    name: AppRoutes.resetPassword,
    page: () => ForgotPasswordResetPassowrdPage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.passwordResetSuccess,
    page: () => ForgotPasswordSuccess(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
];
