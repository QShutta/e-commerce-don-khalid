import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/midle_ware/init_middle_ware.dart';
import 'package:e_commerce_halfa/view/screens/address/add_address.dart';
import 'package:e_commerce_halfa/view/screens/address/view_address.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_passord_reset_password_success_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_password_email_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_password_otp_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/forgot_passowrd/forgot_password_reset_password_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_in_page.dart';

import 'package:e_commerce_halfa/view/screens/auth/sign_up/sign_up_otp.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_up/sign_up_page.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_up/success_sign_up_page.dart';
import 'package:e_commerce_halfa/view/screens/cart.dart';
import 'package:e_commerce_halfa/view/screens/favorite/favorite.dart';
import 'package:e_commerce_halfa/view/screens/favorite/favorite_product_details.dart';
import 'package:e_commerce_halfa/view/screens/home_with_bottom_nav.dart';
import 'package:e_commerce_halfa/view/screens/language_selection.dart';
import 'package:e_commerce_halfa/view/screens/onboarding.dart';
import 'package:e_commerce_halfa/view/screens/product_details.dart';
import 'package:e_commerce_halfa/view/screens/products.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/search_page.dart';
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
  GetPage(
    name: AppRoutes.home,
    page: () => HomeWithBottomNav(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.productsRoot,
    page: () => ProductsPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.productDetails,
    page: () => ProductDetails(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.favorite,
    page: () => FavoritePage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.favoriteProductDetails,
    page: () => FavProductDetails(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => CartPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  //---------------------------Address-------------------------------
  GetPage(
    name: AppRoutes.viewAddress,
    page: () => ViewAddress(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.addAddress,
    page: () => AddAddress(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),

  //------------------------------------End Address---------------------------
];
