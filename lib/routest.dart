import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/midle_ware/init_middle_ware.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_passord_reset_password_success_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_password_email_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_password_otp_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_password_reset_password_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_in_page.dart';

import 'package:e_commerce_halfa/view/screens/auth/sign_up/sign_up_otp.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_up/sign_up_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_up/success_sign_up_page.dart';
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
    name: AppRoutes.signUpOtp,
    page: () => SignUpOtp(),
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
    page: () => EmailPage(),
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
    name: AppRoutes.successSignUp,
    page: () => SuccessSignUpPage(),
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
