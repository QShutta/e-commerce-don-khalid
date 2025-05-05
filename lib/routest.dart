import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/screens/auth/sign_in_page.dart';
import 'package:e_commerce_halfa/view/screens/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.onBoarding: (context) => Onboarding(),
  AppRoutes.signIn: (context) => SignInPage(),
};
